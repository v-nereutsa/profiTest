//
//  FriendsTableViewManagerInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 19.10.2021.
//

import Foundation
import UIKit

protocol FriendsTableViewManagerInput {
    func subcribe(listener: FriendsTableViewManagerListener)
    func setTableView(tableView: UITableView)
    func setDataset(data: [CellEntity])
}
