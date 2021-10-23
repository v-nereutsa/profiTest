//
//  FriendsInteractor.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

final class FriendsInteractor: FriendsInteractorInput {
    
    private weak var presenter: FriendsInteractorOutput!
    
    private var networkEngine: NetworkClient!
    
    required init(presenter: FriendsInteractorOutput, networkEngine: NetworkClient) {
        self.presenter = presenter
        self.networkEngine = networkEngine
    }
    
    func loadFriends(for user: String) {
        let command = LoadFriendsVKNetworkCommand(userID: user)
        networkEngine.execute(command: command, completion: { (value) in
            switch value {
            case .success(let response):
                let decodedData = command.decodeResponse(data: response)
                switch decodedData {
                case .success(let friendsBundle):
                    self.presenter.onFriendsRecevied(data: friendsBundle)
                case .failure(let error):
                    self.presenter.onErrorReceived(error: error)
                }
            case .failure(let error):
                self.presenter.onErrorReceived(error: error)
            }
        })
    }
    
}
