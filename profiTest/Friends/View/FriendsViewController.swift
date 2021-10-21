//
//  FriendsViewController.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import UIKit

final class FriendsViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var friendsTableView: UITableView!
    
    var presenter: FriendsPresenterInput!
    private let configurator: FriendsConfiguratorInput = FriendsConfigurator()
    private let tableViewManager: FriendsTableViewManagerInput = FriendsTableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        tableViewManager.subcribe(listener: self)
        tableViewManager.setTableView(tableView: friendsTableView)
    }
    
    @IBAction func onSearchClicked(_ sender: Any) {
        presenter.onSearchClicked(userId: searchTextField.text)
    }
    
}

extension FriendsViewController: FriendsViewControllerInput {
    func updateTextFields(value: String) {
        searchTextField.text = value
    }
    
    func setTableData(data: [Friend]) {
        DispatchQueue.main.async { [weak self] in
            print(data)
            self?.tableViewManager.setDataset(data: data)
        }
    }
}

extension FriendsViewController: FriendsTableViewManagerListener {
    func didSelectRow(at indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
