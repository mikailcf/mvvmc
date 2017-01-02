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

    private var navigationController: UINavigationController? = nil

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

    }
}
