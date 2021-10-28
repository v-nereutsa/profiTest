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
    
    init(viewControler: UIViewController) {
        self.viewController = viewControler
    }
    
    func showAlert(with data: AlertData) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.viewController.present(alertController, animated: true)
        }
    }
    
}
