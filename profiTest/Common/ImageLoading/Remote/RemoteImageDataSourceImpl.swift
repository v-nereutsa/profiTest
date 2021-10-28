//
//  RemoteImageDataSourceImpl.swift
//  profiTest
//
//  Created by Владимир Нереуца on 28.10.2021.
//

import Foundation
import UIKit

class RemoteImageDataSourceImpl: RemoteImageDataSource {
    func loadImage(from url: URL, completion: @escaping (UIImage?, URL) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, url)
                return
            }
            completion(UIImage(data: data), url)
        }).resume()
    }
}
