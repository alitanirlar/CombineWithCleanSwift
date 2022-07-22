//
//  UsersWorker.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import Foundation
import Combine
import Alamofire

final class UsersWorker {
  
  // MARK: - Private Properties
    func fetchUsers() -> Future<UsersResponseModel, Error> {
         let url = URL(string: "https://reqres.in/api/users")!
        return BaseService.request(url: url)
    }
  //

  // MARK: - Working Logic
  
  //
}
