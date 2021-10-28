//
//  LocalImageDataSourceImpl.swift
//  profiTest
//
//  Created by Владимир Нереуца on 28.10.2021.
//

import Foundation
import UIKit

class LocalImageDataSourceImpl: LocalImageDataSource {
    private let cachedImages = NSCache<NSURL, UIImage>()
    
    init() {
        cachedImages.countLimit = 100
    }
    
    func cacheImage(image: UIImage, for url: NSURL) {
        cachedImages.setObject(image, forKey: url)
    }
    
    func getImage(for url: NSURL) -> UIImage? {
        return cachedImages.object(forKey: url)
    }
}
