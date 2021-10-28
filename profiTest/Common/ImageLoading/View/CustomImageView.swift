//
//  CustomImageView.swift
//  profiTest
//
//  Created by Владимир Нереуца on 28.10.2021.
//

import UIKit

class CustomImageView: UIImageView {

    private var imageURL: URL?
    
    func loadImage(from url: URL?) {
        guard let url = url else {
            return
        }

        imageURL = url
        image = nil
        
        ImageLoadingManager.shared.getImage(for: url, completion: { [weak self] newImage, newImageURL in
            if self?.imageURL == newImageURL {
                self?.image = newImage
            }
        })
    }

}
