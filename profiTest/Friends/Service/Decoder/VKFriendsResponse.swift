//
//  VKFriendsResponse.swift
//  profiTest
//
//  Created by Владимир Нереуца on 23.10.2021.
//

import Foundation

struct VKFriendsResponse: Decodable {
    let bundle: VKFriendsBundle
    
    enum CodingKeys: String, CodingKey {
        case bundle = "response"
    }
    
    struct VKFriendsBundle: Decodable {
        let count: Int
        let items: [Friend]
    }
}

struct Friend: Decodable {
    
    let firstName: String
    let lastName: String
    let photoURL: String
    let trackCode: String
    let userID: Int
    let canAccessClosed: Bool?
    let isClosed: Bool?
    let deactivated: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case userID = "id"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case photoURL = "photo_200_orig"
        case trackCode = "track_code"
        case deactivated = "deactivated"
    }
}
