//
//  UsersResponseModel.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import Foundation

// MARK: - UsersResponseModel
struct UsersResponseModel: Codable {
    let page, perPage, total, totalPages: Int
    let user: [User]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case user = "data"
        case  support
    }
}

// MARK: - Datum
struct User: Identifiable, Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
