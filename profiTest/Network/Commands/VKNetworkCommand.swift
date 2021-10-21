//
//  VKNetworkCommand.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation

protocol VKNetworkCommand: NetworkCommand {
    var API_VERSION: String { get }
    var API_LANGUAGE: String { get }
    func getVKQuery() -> URLComponents
}

extension VKNetworkCommand {
    var API_SCHEME: String {
        return "https"
    }
    var API_HOST: String {
        return "api.vk.com"
    }
    var API_VERSION: String {
        return "5.131"
    }
    var API_LANGUAGE: String {
        return "ru"
    }
    func getQuery() -> URL? {
        var query = getVKQuery()
        query.scheme = API_SCHEME
        query.host = API_HOST
    
        query.queryItems?.append(contentsOf: [ URLQueryItem(name: "v", value: API_VERSION),
                                               URLQueryItem(name: "lang", value: API_LANGUAGE),
                                               URLQueryItem(name: "access_token", value: ACCESS_TOKEN) ])

        return query.url
    }
}

