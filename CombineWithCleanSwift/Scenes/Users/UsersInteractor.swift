//
//  UsersInteractor.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import Foundation
import Combine

protocol UsersBusinessLogic {
    func getUsers()


}

protocol UsersDataStore {

}

final class UsersInteractor: UsersBusinessLogic, UsersDataStore {

    // MARK: - Public Properties

    var presenter: UsersPresentationLogic?
    lazy var worker = UsersWorker()

    // MARK: - Private Properties
    private var cancellableSet = Set<AnyCancellable>()
    //

    // MARK: - Business Logic
    func getUsers() {
        worker.fetchUsers()
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    print(error)
                }
            }, receiveValue: {[weak self] response in
                let response = UsersModels.Users.Response(model: response)
                self?.presenter?.presentUsers(response: response)

            }).store(in: &cancellableSet)
    }

    //
}
