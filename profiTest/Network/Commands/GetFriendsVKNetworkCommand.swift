//
//  GetFriendsVKNetworkCommand.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation

final class GetFriendsVKNetworkCommand: VKNetworkCommand {
    
    private let userID: String
    private let queryFields = "photo_200_orig"
    var path: String = "/method/friends.get"
    var additionalParams: [String: String] {
        return ["fields": queryFields,
                "user_id": userID]
    }
    
    init(userID: String) {
        self.userID = userID
    }

}
