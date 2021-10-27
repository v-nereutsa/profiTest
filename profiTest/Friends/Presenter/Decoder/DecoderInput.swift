//
//  DecoderInput.swift
//  profiTest
//
//  Created by Владимир Нереуца on 26.10.2021.
//

import Foundation

protocol DecoderInput: AnyObject {
    associatedtype T: Decodable
    associatedtype E: Decodable, Error
    
    func decodeResponse(data: Data) -> Result<T, Error>
}

extension DecoderInput {
    func decodeResponse(data: Data) -> Result<T, Error> {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(T.self, from: data)
            return .success(response)
        } catch {
            do {
                let error = try decoder.decode(E.self, from: data)
                return .failure(error)
            } catch {
                return .failure(NetworkError.decodeResponseError(errorDescription: "Error while decoding response."))
            }
        }
    }
}
