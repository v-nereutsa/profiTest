//
//  FriendTableViewCell.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!
    
}

extension FriendTableViewCell: CommonTableViewCell {
    func configure(with value: CellEntity) {
        let cellData = value as! Friend
        getData(from: URL(string: cellData.photoURL)!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.friendImageView.image = UIImage(data: data)
            }
        }
        friendName.text = "\(cellData.firstName) \(cellData.lastName)"
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
