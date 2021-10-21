//
//  CommonTableViewCell.swift
//  profiTest
//
//  Created by Владимир Нереуца on 20.10.2021.
//

import Foundation
import UIKit

protocol CommonTableViewCell: UITableViewCell {
    func configure(with value: CellEntity)
}
