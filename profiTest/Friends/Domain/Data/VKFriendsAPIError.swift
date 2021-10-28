//
//  VKFriendsAPIError.swift
//  profiTest
//
//  Created by Владимир Нереуца on 23.10.2021.
//

import Foundation

struct VKFriendsAPIError: Decodable, Error {
    let error: VKError
    
    struct VKError: Decodable {
        let errorCode: Int
        let errorMessage: String
        let requestParams: [VKRequestParam]
        enum CodingKeys: String, CodingKey {
            case errorCode = "error_code"
            case errorMessage = "error_msg"
            case requestParams = "request_params"
        }
        
        struct VKRequestParam: Decodable {
            let key: String
            let value: String
        }
    }
}


