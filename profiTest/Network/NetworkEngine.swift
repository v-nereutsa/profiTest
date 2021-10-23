//
//  NetworkEngine.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

class NetworkEngine: NetworkClient {
    
    static let shared: NetworkClient = NetworkEngine()
    
    func execute(command: NetworkCommand, completion: @escaping (Result<Data, Error>) -> Void) {
        var query = URLComponents()
        query.scheme = command.scheme
        query.host = command.host
        query.path = command.path
        query.queryItems = command.params.map{(key, value) in URLQueryItem(name: key, value: value)}
        
        let url = query.url!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(NetworkError.invalidResponseCode(responseCode: response.statusCode, errorDescription: "Invalid response code")))
                return
            }
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.invalidData(errorDescription: "Invalid data")))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    
}
    
