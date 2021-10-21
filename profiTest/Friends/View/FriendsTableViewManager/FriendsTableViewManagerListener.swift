//
//  FriendsTableViewManagerListener.swift
//  profiTest
//
//  Created by Владимир Нереуца on 19.10.2021.
//

import Foundation

protocol FriendsTableViewManagerListener: AnyObject {
    func didSelectRow(at indexPath: IndexPath)
}
