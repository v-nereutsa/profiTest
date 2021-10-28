//
//  FriendsInteractorInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

protocol FriendsInteractorInput: AnyObject {
    init(presenter: FriendsInteractorOutput, service: FriendsServiceInput) 
    func loadFriends(for user: String)
}
