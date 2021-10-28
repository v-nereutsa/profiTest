//
//  FriendsInteractor.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

final class FriendsInteractor: FriendsInteractorInput {
    
    private weak var output: FriendsInteractorOutput!
    
    private let friendsService: FriendsServiceInput
    
    init(output: FriendsInteractorOutput, friendsService: FriendsServiceInput) {
        self.output = output
        self.friendsService = friendsService
    }
    
    func loadFriends(for user: String) {
        friendsService.getFriends(for: user, completion: { [weak self] (value) in
            switch value {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.output.onFriendsRecevied(data: result, userId: user)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.output.onErrorReceived(error: error)
                }
            }
        })
    }
    
}
