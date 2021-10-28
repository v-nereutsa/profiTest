//
//  FriendsPresenter.swift
//  profiTest
//
//  Created by Владимир Нереуца on 18.10.2021.
//

import Foundation

final class FriendsPresenter: FriendsPresenterInput {
    
    private weak var view: FriendsViewControllerInput!
    
    var interactor: FriendsInteractorInput!
    
    private let router: FriendsRouterInput
    
    private var dataset = [FriendCellItem]()
    
    init(view: FriendsViewControllerInput, router: FriendsRouterInput) {
        self.view = view
        self.router = router
    }
    
    func onSearchClicked(userId: String?) {
        if let userId = userId, Int(userId) != nil {
            view.dismissKeyboard()
            view.showLoading()
            interactor.loadFriends(for: userId)
        } else {
            router.showAlert(with: AlertData(title: "Error", message: "Invalid user identifier"))
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let userId = "\(dataset[indexPath.row].userID)"
        view.showLoading()
        interactor.loadFriends(for: userId)
    }
}

extension FriendsPresenter: FriendsInteractorOutput {
    
    func onFriendsRecevied(data: VKFriendsResponse, userId: String) {
        dataset = mapData(data: data)
        view.hideLoading()
        view.setTableData(data: dataset)
        view.updateUserIdentifier(value: userId)
    }
    
    func onErrorReceived(error: Error) {
        view.hideLoading()
        switch error {
        case is VKFriendsAPIError:
            let concreteError = error as! VKFriendsAPIError
            router.showAlert(with: AlertData(title: String(concreteError.error.errorCode), message: concreteError.error.errorMessage))
        case is NetworkError:
            let concreteError = error as! NetworkError
            switch concreteError {
            case .invalidResponseCode(let responseCode, let errorDescription):
                router.showAlert(with: AlertData(title: "Error \(responseCode)", message: errorDescription))
            case .invalidData(let errorDescription), .decodeResponseError(let errorDescription), .invalidRequestURL(let errorDescription):
                router.showAlert(with: AlertData(title: "Error", message: errorDescription))
            }
        default:
            let concreteError = error as NSError
            router.showAlert(with: AlertData(title: "Error \(concreteError.code)", message: concreteError.description))
        }
        
    }
    
}

extension FriendsPresenter {
    private func mapData(data: VKFriendsResponse) -> [FriendCellItem] {
        return data.bundle.items.map { FriendCellItem(fullName: "\($0.firstName) \($0.lastName)", photoURL: $0.photoURL, userID: $0.userID) }
    }
}
