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
        let networkClient = NetworkEngine.shared
        let decoder = LoadFriendsVKDecoder()
        let interactor = FriendsInteractor(presenter: presenter, decoder: decoder, networkClient: networkClient)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
}
