//
//  FriendsInteractorInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

protocol FriendsInteractorInput: AnyObject {
    init(presenter: FriendsInteractorOutput, decoder: LoadFriendsVKDecoder, networkClient: NetworkClient)
    func loadFriends(for user: String)
}
