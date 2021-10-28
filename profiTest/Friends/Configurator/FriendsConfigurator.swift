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
        let decoder = FriendsVKDecoder()
        let service = FriendsService(networkClient: networkClient, decoder: decoder)
        let interactor = FriendsInteractor(output: presenter, friendsService: service)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
}
