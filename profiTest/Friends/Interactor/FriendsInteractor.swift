//
//  FriendsInteractor.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

final class FriendsInteractor: FriendsInteractorInput {
    
    private weak var presenter: FriendsInteractorOutput!
    
    private let service: FriendsServiceInput
    
    required init(presenter: FriendsInteractorOutput, service: FriendsServiceInput) {
        self.presenter = presenter
        self.service = service
    }
    
    func loadFriends(for user: String) {
        service.getFriends(for: user, completion: { [weak self] (value) in
            switch value {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.presenter.onFriendsRecevied(data: result, userId: user)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.presenter.onErrorReceived(error: error)
                }
            }
        })
    }
    
}
