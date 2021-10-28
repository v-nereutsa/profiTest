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
        searchTextField.text = value
    }
    
    func setTableData(data: [CellEntity]) {
        tableViewManager.setDataset(data: data)
    }
    
    func dismissKeyboard() {
        searchTextField.resignFirstResponder()
    }
    
    func showLoading() {
        if loadingView == nil {
            loadingView = createLoadingView()
        }
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.view.addSubview(self.loadingView)
        })
    }
    
    func hideLoading() {
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.loadingView?.removeFromSuperview()
        })
    }
    
    func showEmptyTableMessage(message: String) {
        friendsTableView.setEmptyMessage(message)
    }
    
    func removeEmptyTableMessage() {
        friendsTableView.restore()
    }
    
}

extension FriendsViewController: FriendsTableViewManagerListener {
    func didSelectRow(at indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

extension FriendsViewController {
    func createLoadingView() -> UIView {
        let loadingView = UIView.init(frame: self.view.bounds)
        loadingView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.center = loadingView.center
        loadingView.addSubview(activityIndicator)
        return loadingView
    }
}
