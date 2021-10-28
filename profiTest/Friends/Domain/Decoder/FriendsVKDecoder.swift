//
//  FriendsVKDecoder.swift
//  profiTest
//
//  Created by Владимир Нереуца on 26.10.2021.
//

import Foundation

final class FriendsVKDecoder: FriendsVKDecoderInput {
    func decodeFriendsResponse(data: Data) -> Result<VKFriendsResponse, Error> {
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
