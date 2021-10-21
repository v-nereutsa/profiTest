//
//  FriendsViewControllerInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

protocol FriendsViewControllerInput: AnyObject {
    func setTableData(data: [Friend])
    func updateTextFields(value: String)
}
