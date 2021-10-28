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
    
    private var loadingView: UIView!
    
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
        loadingView = createLoadingView()
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
    
    func showLoading() {
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.view.addSubview(self.loadingView)
        }, completion: nil)
    }
    
    func hideLoading() {
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.loadingView?.removeFromSuperview()
        }, completion: nil)
    }
}

extension FriendsViewController: FriendsTableViewDelegateListener {
    func didSelectRow(at indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

extension FriendsViewController {
    func createLoadingView() -> UIView {
        let loadingView = UIView.init(frame: self.view.bounds)
        loadingView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.center = loadingView.center
        loadingView.addSubview(activityIndicator)
        return loadingView
    }
}
