//
//  FriendsTableViewDelegate.swift
//  profiTest
//
//  Created by Владимир Нереуца on 27.10.2021.
//

import Foundation
import UIKit

final class FriendsTableViewDelegate: NSObject {
    weak private var listener: FriendsTableViewDelegateListener!
}

extension FriendsTableViewDelegate: FriendsTableViewDelegateInput {
    func subcribe(listener: FriendsTableViewDelegateListener, tableView: UITableView) {
        self.listener = listener
        tableView.delegate = self
    }
}

extension FriendsTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        listener.didSelectRow(at: indexPath)
    }
}
