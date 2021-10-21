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
    
    var dataset = [CellEntity]()
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
    }
}

extension FriendsTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataset.count
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
        listener.didSelectRow(at: indexPath)
    }
}
