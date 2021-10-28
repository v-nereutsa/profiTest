//
//  FriendsServiceInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 27.10.2021.
//

import Foundation

protocol FriendsServiceInput: AnyObject {
    init(networkClient: NetworkClient, decoder: FriendsVKDecoderInput)
    func getFriends(for user: String, completion: @escaping (Result<VKFriendsResponse, Error>) -> Void)
}
