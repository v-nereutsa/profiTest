//
//  NetworkCommand.swift
//  profiTest
//
//  Created by Владимир Нереуца on 19.10.2021.
//

import Foundation

protocol NetworkCommand {
    var scheme:  String { get }
    var host:  String { get }
    var path:  String { get }
    var params: [String: String] { get }
}
