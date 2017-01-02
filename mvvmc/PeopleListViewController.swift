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

    fileprivate var coordinator: MainCoordinator? = nil
    fileprivate var peopleList: [Person]? = nil

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

    static func fromStoryboard(coordinator: MainCoordinator, peopleList: [Person]) -> PeopleListViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)

        guard let peopleListViewController = storyboard.instantiateViewController(withIdentifier: viewControllerName) as? PeopleListViewController else { return nil }
        peopleListViewController.coordinator = coordinator
        peopleListViewController.peopleList = peopleList

        return peopleListViewController
    }

    // MARK: View

    override func viewDidLoad() {
        peopleTableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.cellID)
        peopleTableView.dataSource = self
        peopleTableView.estimatedRowHeight = PersonTableViewCell.minHeight()

        super.viewDidLoad()
    }

}

extension PeopleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellID, for: indexPath) as? PersonTableViewCell,
            let peopleList = peopleList
        else {
            return UITableViewCell()
        }

        cell.setup(person: peopleList[indexPath.row])

        return cell
    }
}
