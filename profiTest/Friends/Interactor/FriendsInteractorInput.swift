//
//  FriendsInteractorInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

protocol FriendsInteractorInput: AnyObject {
    init(presenter: FriendsInteractorOutput, networkClient: NetworkClient)
    func loadFriends(for user: String)
}
