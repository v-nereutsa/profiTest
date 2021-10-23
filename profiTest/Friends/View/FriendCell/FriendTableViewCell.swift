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
        let cellData = value as! FriendViewItem
        friendImageView.layer.cornerRadius = friendImageView.frame.size.width / 2
        friendImageView.image = nil
        friendImageView.downloadImage(from: URL(string: cellData.photoURL))
        friendName.text = cellData.fullName
    }
}
