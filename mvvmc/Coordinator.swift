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
}

class Coordinator {

    static let shared = Coordinator()

    fileprivate var navigationController: UINavigationController? = nil

    func setNavigationController(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func appInit() {
        guard let navigationController = navigationController else { return }

        navigationController.viewControllers = [FirstViewController(coordinator: self)]
    }
}

extension Coordinator: MainCoordinator {

    func showPeopleList() {
        guard
            let navigationController = navigationController,
            let peopleListviewController = PeopleListViewController.fromStoryboard(coordinator: self, peopleList: DataManager.getLocalPersonsList())
        else { return }

        navigationController.pushViewController(peopleListviewController, animated: true)
    }
}
