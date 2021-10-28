//
//  FriendsVKDecoderInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 26.10.2021.
//

import Foundation

protocol FriendsVKDecoderInput: AnyObject {
    func decodeFriendsResponse(data: Data) -> Result<VKFriendsResponse, Error>
}
