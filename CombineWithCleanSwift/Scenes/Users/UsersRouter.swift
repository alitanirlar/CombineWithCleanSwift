//
//  UsersRouter.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import UIKit

protocol UsersRoutingLogic {

}

protocol UsersDataPassing {
  var dataStore: UsersDataStore? { get }
}

final class UsersRouter: UsersRoutingLogic, UsersDataPassing {

  // MARK: - Public Properties

  weak var viewController: UsersViewController?
  var dataStore: UsersDataStore?
  
  // MARK: - Private Properties
  
  //

  // MARK: - Routing Logic
  
  //

  // MARK: - Navigation
  
  //

  // MARK: - Passing data
  
  //
}
