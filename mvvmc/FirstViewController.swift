//
//  ViewController.swift
//  mvvmc
//
//  Created by Mikail on 12/14/16.
//  Copyright © 2016 Mikail. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    private var coordinator: MainCoordinator? = nil

    init(coordinator: MainCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Actions

    @IBAction func peopleListButtonClick() {
        coordinator?.showPeopleList()
    }
}
