//
//  LoadFriendsVKNetworkCommand.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation

final class LoadFriendsVKNetworkCommand: VKNetworkCommand {
    typealias T = VKFriendsResponse
    
    private let userID: String
    private let queryFields = ["photo_200_orig"]
    
    var path: String = "/method/friends.get"
    var additionalParams: [String: String] {
        return ["fields": queryFields.joined(separator: ","),
                "user_id": userID]
    }
    
    init(userID: String) {
        self.userID = userID
    }

    
    func decodeResponse(data: Data) -> Result<VKFriendsResponse, Error> {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(VKFriendsResponse.self, from: data)
            return .success(response)
        } catch {
            do {
                let error = try decoder.decode(VKFriendsAPIError.self, from: data)
                return .failure(error)
            } catch {
                return .failure(NetworkError.decodeResponseError(errorDescription: "Error while decoding response."))
            }
        }
    }

}
