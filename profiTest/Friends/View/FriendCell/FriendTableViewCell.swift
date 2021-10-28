//
//  FriendTableViewCell.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendImageView: CustomImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        friendImageView.layer.cornerRadius = friendImageView.frame.size.width / 2
    }
    
}

extension FriendTableViewCell: CommonTableViewCell {
    func configure(with value: CellEntity) {
        let cellData = value as! FriendCellItem
        
        friendImageView.image = nil
        friendImageView.loadImage(from: NSURL(string: cellData.photoURL))
        friendName.text = cellData.fullName
    }
}
