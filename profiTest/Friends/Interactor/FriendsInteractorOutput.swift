//
//  FriendsInteractorOutput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation

protocol FriendsInteractorOutput: AnyObject {
    func onFriendsRecevied(data: [Friend])
}
