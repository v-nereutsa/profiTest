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
    private var dataset = [Friend]()
    
    
    required init(view: FriendsViewControllerInput, router: FriendsRouterInput) {
        self.view = view
        self.router = router
    }
    
    func onSearchClicked(userId: String?) {
        if let userId = userId {
            interactor.getFriends(for: userId)
        } else {
            
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let userId = String(dataset[indexPath.row].userID)
        view.updateTextFields(value: userId)
        interactor.getFriends(for: userId)
    }
}

extension FriendsPresenter: FriendsInteractorOutput {
    func onFriendsRecevied(data: [Friend]) {
        dataset = data
        view.setTableData(data: data)
    }
}
