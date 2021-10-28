//
//  FriendsPresenterInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

protocol FriendsPresenterInput: AnyObject {
    func onSearchClicked(userId: String?)
    func didSelectRow(at indexPath: IndexPath)
}
