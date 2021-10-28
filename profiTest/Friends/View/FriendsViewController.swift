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
    
    func showLoading(isLoading: Bool) {
        if loadingView == nil {
            loadingView = createLoadingView()
            view.addSubview(loadingView)
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.loadingView.alpha = isLoading ? 1 : 0
        })
    }
    
    func showEmptyTableMessage(message: String) {
        tableViewManager.showEmptyTableMessage(message: message)
    }
    
    func removeEmptyTableMessage() {
        tableViewManager.removeEmptyTableMessage()
    }
    
}

extension FriendsViewController: FriendsTableViewManagerListener {
    func didSelectRow(at indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

extension FriendsViewController {
    func createLoadingView() -> UIView {
        let loadingView = UIActivityIndicatorView(frame: self.view.bounds)
        if #available(iOS 13.0, *) {
            loadingView.style = .large
        } else {
            loadingView.style = .whiteLarge
        }
        loadingView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        loadingView.startAnimating()
        loadingView.alpha = 0
        return loadingView
    }
}
