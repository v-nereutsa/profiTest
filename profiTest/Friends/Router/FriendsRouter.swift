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
    
    func show(alert: AlertEntity) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.viewController.present(alertController, animated: true)
        }
    }
    
    func show(loading: Bool, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            if loading {
                let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)

                let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
                loadingIndicator.hidesWhenStopped = true
                loadingIndicator.style = UIActivityIndicatorView.Style.gray
                loadingIndicator.startAnimating();
                
                alert.view.addSubview(loadingIndicator)
                
                self.viewController.present(alert, animated: true, completion: completion)
            } else {
                self.viewController.dismiss(animated: true, completion: completion)
            }
        }
    }
    
}
