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
    var API_PATH: String = "/method/friends.get"
    
    init(userID: String) {
        self.userID = userID
    }
    
    func getVKQuery() -> URLComponents {
        var query = URLComponents()
        query.path = API_PATH
        query.queryItems = [URLQueryItem(name: "fields", value: queryFields),
                            URLQueryItem(name: "user_id", value: userID)]
        return query
    }
}
