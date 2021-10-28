//
//  LocalImageDataSource.swift
//  profiTest
//
//  Created by Владимир Нереуца on 28.10.2021.
//

import Foundation
import UIKit

protocol LocalImageDataSource: AnyObject {
    func cacheImage(image: UIImage, for url: NSURL)
    func getImage(for url: NSURL) -> UIImage?
}
