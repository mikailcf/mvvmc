//
//  Coordinator.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import UIKit

protocol MainCoordinator {
    
    func showPeopleList()
    func showFirstDetails(index: Int)
    func showNextDetails(delegate: PersonDelegate, datasource: PersonDataSource)
}

class Coordinator: MainCoordinator {

    static let shared = Coordinator()

    fileprivate var navigationController: UINavigationController? = nil

    func setNavigationController(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func appInit() {
        guard let navigationController = navigationController else { return }

        navigationController.viewControllers = [FirstViewController(delegate: FirstViewModel(coordinator: self))]
    }

    // MARK: MainCoordinator

    func showPeopleList() {
        let peopleListViewModel = PeopleListViewModel(coordinator: self)

        guard
            let navigationController = navigationController,
            let peopleListviewController = PeopleListViewController.fromStoryboard(delegate: peopleListViewModel, datasource: peopleListViewModel)
        else { return }

        navigationController.pushViewController(peopleListviewController, animated: true)
    }

    func showFirstDetails(index: Int) {
        let viewModel = PersonViewModel(coordinator: self)

        guard
            let navigationController = navigationController,
            let viewController = Person1ViewController.fromStoryboard(indexToLoad: index, delegate: viewModel, datasource: viewModel)
            else { return }

        navigationController.pushViewController(viewController, animated: true)
    }

    func showNextDetails(delegate: PersonDelegate, datasource: PersonDataSource) {
        guard
            let navigationController = navigationController,
            let viewController = Person2ViewController.fromStoryboard(delegate: delegate, datasource: datasource)
        else { return }

        navigationController.pushViewController(viewController, animated: true)
    }
}
