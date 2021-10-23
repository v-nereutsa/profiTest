//
//  NetworkError.swift
//  profiTest
//
//  Created by Владимир Нереуца on 23.10.2021.
//

enum NetworkError: Error {
    case invalidResponseCode(responseCode: Int, errorDescription: String)
    case invalidData(errorDescription: String)
    case decodeResponseError(errorDescription: String)
    case invalidRequestURL(errorDescription: String)
}
