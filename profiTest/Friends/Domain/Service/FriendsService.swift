//
//  FriendsService.swift
//  profiTest
//
//  Created by Владимир Нереуца on 27.10.2021.
//

import Foundation

final class FriendsService: FriendsServiceInput {
    
    private let networkClient: NetworkClient
    private let decoder: FriendsVKDecoderInput
    
    
    init(networkClient: NetworkClient, decoder: FriendsVKDecoderInput) {
        self.networkClient = networkClient
        self.decoder = decoder
    }
    
    func getFriends(for user: String, completion: @escaping (Result<VKFriendsResponse, Error>) -> Void) {
        let command = LoadFriendsVKNetworkCommand(userID: user)
        networkClient.execute(command: command, completion: { [weak decoder] (value) in
            switch value {
                case .success(let response):
                    let decodedData = decoder?.decodeFriendsResponse(data: response)
                    switch decodedData {
                    case .success(let friendsBundle):
                        completion(.success(friendsBundle))
                    case .failure(let error):
                        completion(.failure(error))
                    case .none:
                        completion(.failure(NetworkError.decodeResponseError(errorDescription: "Error while decoding response.")))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
        })
    }
}
