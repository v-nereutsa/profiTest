//
//  RemoteImageDataSource.swift
//  profiTest
//
//  Created by Владимир Нереуца on 28.10.2021.
//

import Foundation
import UIKit

protocol RemoteImageDataSource: AnyObject {
    func loadImage(from url: URL, completion: @escaping (UIImage?, URL) -> Void)
}
