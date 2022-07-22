//
//  UsersPresenter.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import UIKit

protocol UsersPresentationLogic {
    func presentUsers(response: UsersModels.Users.Response)
}

final class UsersPresenter: UsersPresentationLogic {
    
    // MARK: - Public Properties
    
    weak var viewController: UsersDisplayLogic?
    
    // MARK: - Private Properties
    
    //
    
    // MARK: - Presentation Logic
    func presentUsers(response: UsersModels.Users.Response) {
        var displayedUsers = [UsersModels.Users.ViewModel.DisplayedUser]()
        response.model?.user.forEach({
            let avatarUrl = URL(string: $0.avatar)
            let fullName = $0.firstName + " " + $0.lastName
            let user = UsersModels.Users.ViewModel.DisplayedUser(fullName: fullName,
                                                                 avatarUrl: avatarUrl)
            displayedUsers.append(user)
        })
        let viewModel = UsersModels.Users.ViewModel(displayedUsers: displayedUsers)
        viewController?.displayUsers(viewModel: viewModel)
    }
    
    //
}
