//
//  FriendsRouter.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation
import UIKit

class FriendsRouter: FriendsRouterInput {
    private weak var viewController: UIViewController!
    
    required init(viewControler: UIViewController) {
        self.viewController = viewControler
    }
}
