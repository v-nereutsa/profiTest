//
//  FriendsRouterInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation
import UIKit

protocol FriendsRouterInput: AnyObject {
    init(viewControler: UIViewController)
    func show(alert: AlertEntity)
    func show(loading: Bool, completion: (() -> Void)?)
}
