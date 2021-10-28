//
//  FriendsTableViewManagerInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 28.10.2021.
//

import Foundation
import UIKit

protocol FriendsTableViewManagerInput {
    func subcribe(listener: FriendsTableViewManagerListener)
    func setTableView(tableView: UITableView)
    func setDataset(data: [CellEntity])
    func showEmptyTableMessage(message: String)
    func removeEmptyTableMessage()
}
