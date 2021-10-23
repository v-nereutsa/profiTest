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
    private var dataset = [FriendViewItem]()
    
    required init(view: FriendsViewControllerInput, router: FriendsRouterInput) {
        self.view = view
        self.router = router
    }
    
    func onSearchClicked(userId: String?) {
        if let userId = userId, userId != "", userId.isNumber {
            view.dismissKeyboard()
            router.show(loading: true, completion: nil)
            interactor.loadFriends(for: userId)
        } else {
            router.show(alert: AlertEntity(title: "Error", message: "Invalid user identifier"))
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let userId = String(dataset[indexPath.row].userID)
        view.updateTextFields(value: userId)
        router.show(loading: true, completion: nil)
        interactor.loadFriends(for: userId)
    }
}

extension FriendsPresenter: FriendsInteractorOutput {
    
    func onFriendsRecevied(data: VKFriendsResponse) {
        dataset = mapData(data: data)
        router.show(loading: false, completion: nil)
        view.setTableData(data: dataset)
    }
    
    func onErrorReceived(error: Error) {
        var completion: (() -> Void)? = nil
        switch error {
        case is VKFriendsAPIError:
            let concreteError = error as! VKFriendsAPIError
            completion = {
                self.router.show(alert: AlertEntity(title: String(concreteError.error.errorCode), message: concreteError.error.errorMessage))
            }
        case is NetworkError:
            let concreteError = error as! NetworkError
            switch concreteError {
            case .invalidResponseCode(let responseCode, let errorDescription):
                completion = {
                    self.router.show(alert: AlertEntity(title: String(responseCode), message: errorDescription))
                }
            case .invalidData(let errorDescription), .decodeResponseError(let errorDescription):
                completion = {
                    self.router.show(alert: AlertEntity(title: "Error", message: errorDescription))
                }
            }
        default:
            let concreteError = error as NSError
            completion = {
                self.router.show(alert: AlertEntity(title: String(concreteError.code), message: concreteError.description))
            }
        }
        router.show(loading: false, completion: completion)
    }
    
}

extension FriendsPresenter {
    private func mapData(data: VKFriendsResponse) -> [FriendViewItem] {
        return data.bundle.items.map { FriendViewItem(fullName: "\($0.firstName) \($0.lastName)", photoURL: $0.photoURL, userID: $0.userID) }
    }
}
