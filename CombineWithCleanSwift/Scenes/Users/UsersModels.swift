//
//  UsersModels.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import UIKit

enum UsersModels {

    // MARK: - Something

    enum Users {
        struct Request {}

        struct Response {
            let model: UsersResponseModel?
        }
        
        struct ViewModel {
            struct DisplayedUser {
                let fullName: String
                let avatarUrl: URL?
            }
            var displayedUsers = [DisplayedUser]()

        }
    }
}
