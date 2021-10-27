//
//  FriendsTableViewDelegateInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 27.10.2021.
//

import UIKit

protocol FriendsTableViewDelegateInput: AnyObject {
    func subcribe(listener: FriendsTableViewDelegateListener, tableView: UITableView)
}

