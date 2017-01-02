//
//  PeopleListViewController.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import UIKit

class PeopleListViewController: UIViewController {

    private static let storyboardName = "PeopleList"
    private static let viewControllerName = "PeopleListViewController"

    private var coordinator: MainCoordinator? = nil
    private var peopleList: [Person]? = nil

    @IBOutlet private var peopleTableView: UITableView!

    // usando Xib

    init(coordinator: MainCoordinator, peopleList: [Person]) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        self.peopleList = peopleList
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // usando storyboard

    static func viewControllerFromStoryboard(coordinator: MainCoordinator, peopleList: [Person]) -> PeopleListViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerName) as? PeopleListViewController
    }

    // MARK: View

    override func viewDidLoad() {

        super.viewDidLoad()
    }

}
