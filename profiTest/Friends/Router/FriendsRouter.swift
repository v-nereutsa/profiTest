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
    
    private var loadingView: UIView?
    
    required init(viewControler: UIViewController) {
        self.viewController = viewControler
    }
    
    func showAlert(with data: AlertData) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.viewController.present(alertController, animated: true)
        }
    }
    
    func showLoading(enable loading: Bool) {
        if loading {
            let loadingView = UIView.init(frame: viewController.view.bounds)
            loadingView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            let activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
            activityIndicator.startAnimating()
            activityIndicator.center = loadingView.center
            DispatchQueue.main.async {
                loadingView.addSubview(activityIndicator)
                self.viewController.view.addSubview(loadingView)
            }
            self.loadingView = loadingView
        } else {
            DispatchQueue.main.async {
                self.loadingView?.removeFromSuperview()
                self.loadingView = nil
            }
        }
    }
    
}
