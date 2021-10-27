//
//  FriendsTableViewDataSourceInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 27.10.2021.
//

import UIKit

protocol FriendsTableViewDataSourceInput: AnyObject {
    func setTableView(tableView: UITableView)
    func setDataset(data: [CellEntity])
}
