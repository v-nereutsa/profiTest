//
//  FriendsTableViewManagerListener.swift
//  profiTest
//
//  Created by Владимир Нереуца on 28.10.2021.
//

import Foundation

protocol FriendsTableViewManagerListener: AnyObject {
    func didSelectRow(at indexPath: IndexPath)
}
