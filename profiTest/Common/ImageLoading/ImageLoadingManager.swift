//
//  ImageLoadingManager.swift
//  profiTest
//
//  Created by Владимир Нереуца on 28.10.2021.
//

import Foundation
import UIKit

final class ImageLoadingManager {
    
    static let shared = ImageLoadingManager()
    
    private let localImageDataSource: LocalImageDataSource = LocalImageDataSourceImpl()
    private let remoteImageDataSource: RemoteImageDataSource = RemoteImageDataSourceImpl()
    
    
    func getImage(for url: URL, completion: @escaping (UIImage?, URL) -> Void) {
        let image = localImageDataSource.getImage(for: url)
        if let image = image {
            completion(image, url)
        } else {
            remoteImageDataSource.loadImage(from: url, completion: { [weak self] remoteImage, remoteURL in
                if let remoteImage = remoteImage {
                    self?.localImageDataSource.cacheImage(image: remoteImage, for: url)
                }
                DispatchQueue.main.async {
                    completion(remoteImage, remoteURL)
                }
            })
        }
    }
}
