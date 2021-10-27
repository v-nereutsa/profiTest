//
//  FriendsViewController.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import UIKit

final class FriendsViewController: UIViewController {
    
    @IBOutlet private var searchButton: UIButton!
    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var friendsTableView: UITableView!
    
    var presenter: FriendsPresenterInput!
    
    private let configurator: FriendsConfiguratorInput = FriendsConfigurator()
    
    private let tableViewDelegate: FriendsTableViewDelegateInput = FriendsTableViewDelegate()
    private let tableViewDataSource: FriendsTableViewDataSourceInput = FriendsTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        tableViewDelegate.subcribe(listener: self, tableView: friendsTableView)
        tableViewDataSource.setTableView(tableView: friendsTableView)
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
        self.searchTextField.text = value
    }
    
    func setTableData(data: [CellEntity]) {
        self.tableViewDataSource.setDataset(data: data)
    }
    
    func dismissKeyboard() {
        searchTextField.resignFirstResponder()
    }
}

extension FriendsViewController: FriendsTableViewDelegateListener {
    func didSelectRow(at indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
