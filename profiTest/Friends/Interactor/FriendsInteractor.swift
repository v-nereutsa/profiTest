//
//  FriendsInteractor.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

final class FriendsInteractor: FriendsInteractorInput {
    
    private weak var presenter: FriendsInteractorOutput!
    
    private let networkClient: NetworkClient
    private let decoder: LoadFriendsVKDecoder
    
    
    required init(presenter: FriendsInteractorOutput, decoder: LoadFriendsVKDecoder, networkClient: NetworkClient) {
        self.presenter = presenter
        self.networkClient = networkClient
        self.decoder = decoder
    }
    
    func loadFriends(for user: String) {
        let command = LoadFriendsVKNetworkCommand(userID: user)
        networkClient.execute(command: command, completion: { [weak self] (value) in
            switch value {
                case .success(let response):
                let decodedData = self?.decoder.decodeResponse(data: response)
                    DispatchQueue.main.async {
                        switch decodedData {
                        case .success(let friendsBundle):
                            self?.presenter.onFriendsRecevied(data: friendsBundle, userId: user)
                        case .failure(let error):
                            self?.presenter.onErrorReceived(error: error)
                        case .none:
                            break
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.presenter.onErrorReceived(error: error)
                    }
                }
        })
    }
    
}
