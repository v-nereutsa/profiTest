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
        setupViews()
    }
    
    @IBAction func onSearchClicked(_ sender: Any) {
        presenter.onSearchClicked(userId: searchTextField.text)
    }
    
    private func setupViews() {
        searchTextField.placeholder = "User identifier"
        searchTextField.text = "156156099"
    }
    
}

extension FriendsViewController: FriendsViewControllerInput {
    func updateUserIdentifier(value: String) {
        DispatchQueue.main.async {
            self.searchTextField.text = value
        }
    }
    
    func setTableData(data: [CellEntity]) {
        DispatchQueue.main.async {
            self.tableViewManager.setDataset(data: data)
        }
    }
    
    func dismissKeyboard() {
        searchTextField.resignFirstResponder()
    }
}

extension FriendsViewController: FriendsTableViewManagerListener {
    func didSelectRow(at indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
