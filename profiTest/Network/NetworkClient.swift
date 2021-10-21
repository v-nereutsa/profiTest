//
//  NetworkClient.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

protocol NetworkClient: AnyObject {
    func execute(command: NetworkCommand, completion: @escaping (Result<Data, Error>) -> Void)
}
