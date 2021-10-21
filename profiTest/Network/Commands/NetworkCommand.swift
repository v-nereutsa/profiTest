//
//  NetworkCommand.swift
//  profiTest
//
//  Created by Владимир Нереуца on 19.10.2021.
//

import Foundation

protocol NetworkCommand {
    var API_SCHEME:  String { get }
    var API_HOST:  String { get }
    var API_PATH:  String { get }
    func getQuery() -> URL?
}
