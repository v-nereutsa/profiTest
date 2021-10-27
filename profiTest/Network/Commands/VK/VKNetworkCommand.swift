//
//  VKNetworkCommand.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation

protocol VKNetworkCommand: NetworkCommand {
    
    var additionalParams: [String: String] { get }

}

extension VKNetworkCommand {
    
    private var apiVersion: String {
        return "5.131"
    }
    private var apiLanguage: String {
        return "ru"
    }
    
    var scheme: String {
        return "https"
    }
    var host: String {
        return "api.vk.com"
    }

    var params: [String: String] {
        let vkParams = ["v": apiVersion,
                        "lang": apiLanguage,
                        "access_token": Bundle.main.infoDictionary?["VK_ACCESS_TOKEN"] as? String]
        return vkParams.compactMapValues{$0}.merging(additionalParams) { (_ , new) in new }
    }
    
}

