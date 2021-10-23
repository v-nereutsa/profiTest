//
//  UIImageViewExtension.swift
//  profiTest
//
//  Created by Владимир Нереуца on 21.10.2021.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(from url: URL?) {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }).resume()
    }
}
