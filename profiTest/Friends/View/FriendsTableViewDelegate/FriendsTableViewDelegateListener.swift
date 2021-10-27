//
//  FriendsTableViewDelegateListener.swift
//  profiTest
//
//  Created by Владимир Нереуца on 27.10.2021.
//

import Foundation

protocol FriendsTableViewDelegateListener: AnyObject {
    func didSelectRow(at indexPath: IndexPath)
}
