//
//  FriendsTableViewDataSource.swift
//  profiTest
//
//  Created by Владимир Нереуца on 27.10.2021.
//

import Foundation
import UIKit

final class FriendsTableViewDataSource: NSObject {
    weak private var tableView: UITableView!
    
    private var dataset = [CellEntity]()
}

extension FriendsTableViewDataSource: FriendsTableViewDataSourceInput {
    
    func setTableView(tableView: UITableView) {
        self.tableView = tableView
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

extension FriendsTableViewDataSource: UITableViewDataSource {
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
