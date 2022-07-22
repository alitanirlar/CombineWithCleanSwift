//
//  UsersViewController.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import UIKit

protocol UsersDisplayLogic: AnyObject {
    func displayUsers(viewModel: UsersModels.Users.ViewModel)

}

final class UsersViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet private weak var tableView: UITableView!

    //

    // MARK: - Public Properties

    var interactor: UsersBusinessLogic?
    var router: (UsersRoutingLogic & UsersDataPassing)?

    // MARK: - Private Properties
    private var displayedUsers = [UsersModels.Users.ViewModel.DisplayedUser]()
    //

    // MARK: - Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let interactor = UsersInteractor()
        let presenter = UsersPresenter()
        let router = UsersRouter()

        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor

        self.interactor = interactor
        self.router = router
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupTableView()
    }

    // MARK: - Public Methods

    //

    // MARK: - Requests

    //

    // MARK: - Private Methods

    private func configure() {
        interactor?.getUsers()

    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil),
                           forCellReuseIdentifier: String(describing: UserTableViewCell.self))
        
    }

    // MARK: - UI Actions

    //
}

// MARK: - Display Logic

extension UsersViewController: UsersDisplayLogic {
    func displayUsers(viewModel: UsersModels.Users.ViewModel) {
        displayedUsers = viewModel.displayedUsers
        tableView.reloadData()
    }

}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayedUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserTableViewCell.self), for: indexPath) as! UserTableViewCell
        let user = displayedUsers[indexPath.row]
        cell.configure(user: user)
        return cell
    }

}
