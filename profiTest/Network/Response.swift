//
//  Response.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation

struct Response: Decodable {
    
    let response: Response
    
    struct Response: Decodable {
        let count: Int
        let items: [Friend]
    }
}
