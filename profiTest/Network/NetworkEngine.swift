//
//  NetworkEngine.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

class NetworkEngine: NetworkClient {
    
    func execute(command: NetworkCommand, completion: @escaping (Result<Data, Error>) -> Void) {
        let url = command.getQuery()!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            completion(error != nil ? .failure(error!) : .success(data!))
        }
        task.resume()
    }
    
}
