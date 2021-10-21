//
//  Friend.swift
//  profiTest
//
//  Created by Владимир Нереуца on 19.10.2021.
//

import Foundation

struct Friend: Decodable, CellEntity {
    
    let firstName: String
    let lastName: String
    let photoURL: String
    let trackCode: String
    let userID: Int
    let canAccessClosed: Bool
    let isClosed: Bool
    
    init(firstName: String, userID: Int, lastName: String, canAccessClosed: Bool, isClosed: Bool, photoURL: String, trackCode: String) {
        self.firstName = firstName
        self.userID = userID
        self.lastName = lastName
        self.canAccessClosed = canAccessClosed
        self.isClosed = isClosed
        self.photoURL = photoURL
        self.trackCode = trackCode
    }
    
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case userID = "id"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case photoURL = "photo_200_orig"
        case trackCode = "track_code"
    }
}
