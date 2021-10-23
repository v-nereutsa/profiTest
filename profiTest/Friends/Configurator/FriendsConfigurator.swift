//
//  FriendsConfigurator.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation

final class FriendsConfigurator: FriendsConfiguratorInput {
    
    func configure(with viewController: FriendsViewController) {
        let router = FriendsRouter(viewControler: viewController)
        let presenter = FriendsPresenter(view: viewController, router: router)
        let networkEngine = NetworkEngine.shared
        let interactor = FriendsInteractor(presenter: presenter, networkEngine: networkEngine)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
}
