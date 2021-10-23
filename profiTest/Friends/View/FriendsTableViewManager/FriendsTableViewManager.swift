//
//  FriendsTableViewManager.swift
//  profiTest
//
//  Created by Владимир Нереуца on 19.10.2021.
//

import Foundation
import UIKit

final class FriendsTableViewManager: NSObject {
    weak private var listener: FriendsTableViewManagerListener!
    weak private var tableView: UITableView!
    
    private var dataset = [CellEntity]()
}

extension FriendsTableViewManager: FriendsTableViewManagerInput {
    
    func subcribe(listener: FriendsTableViewManagerListener) {
        self.listener = listener
    }
    
    func setTableView(tableView: UITableView) {
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "\(FriendTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(FriendTableViewCell.self)")
    }
    
    func setDataset(data: [CellEntity]) {
        self.dataset = data
        tableView.reloadData()
        if tableView.numberOfRows(inSection: 0) != 0 {
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}

extension FriendsTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count =  dataset.count
        if count == 0 {
            tableView.setEmptyMessage("Friends list is empty")
        } else {
            tableView.restore()
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FriendTableViewCell.self)", for: indexPath) as! CommonTableViewCell
        let value = dataset[indexPath.row]
        
        cell.configure(with: value)
        
        return cell
    }
}

extension FriendsTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        listener.didSelectRow(at: indexPath)
    }
}
