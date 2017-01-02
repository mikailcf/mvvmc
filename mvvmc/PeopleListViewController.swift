//
//  PeopleListViewController.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import UIKit

class PeopleListViewController: UIViewController, UITableViewDataSource, PeopleListFeedback {

    private static let storyboardName = "PeopleList"
    private static let viewControllerName = "PeopleListViewController"

    fileprivate var delegate: PeopleListDelegate? = nil
    fileprivate var datasource: PeopleListDataSource? = nil

    @IBOutlet fileprivate var peopleTableView: UITableView!
    @IBOutlet fileprivate var filteredLabel: UILabel!

    // usando Xib

    init(delegate: PeopleListDelegate, datasource: PeopleListDataSource) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        self.datasource = datasource
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // usando storyboard

    static func fromStoryboard(delegate: PeopleListDelegate, datasource: PeopleListDataSource) -> PeopleListViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)

        guard let peopleListViewController = storyboard.instantiateViewController(withIdentifier: viewControllerName) as? PeopleListViewController else { return nil }
        peopleListViewController.delegate = delegate
        peopleListViewController.datasource = datasource

        return peopleListViewController
    }

    // MARK: View

    override func viewDidLoad() {
        peopleTableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.cellID)
        peopleTableView.dataSource = self
        peopleTableView.estimatedRowHeight = PersonTableViewCell.minHeight()

        delegate?.loadPeopleList(feedback: self)

        filteredLabel.text = "Not filtered"

        super.viewDidLoad()
    }

    // MARK: Actions

    @IBAction func filter() {
        delegate?.setFilterAs(filterActive: true, feedback: self)
    }

    @IBAction func removeFilter() {
        delegate?.setFilterAs(filterActive: false, feedback: self)
    }

    @IBAction func addPerson() {

    }

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.peopleList?.count ?? 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellID, for: indexPath) as? PersonTableViewCell
        else {
            return UITableViewCell()
        }

        if let peopleList = datasource?.peopleList {
            cell.setup(person: peopleList[indexPath.row])
        } else {
            cell.setupAsEmpty()
        }

        return cell
    }

    // MARK: PeopleListFeedback

    func didLoadPeopleList(error: DataError?) {
        peopleTableView.reloadData()
    }

    func didChangeFilter(isFilterActive: Bool) {
        peopleTableView.reloadData()
        filteredLabel.text = isFilterActive ? "Filtered" : "Not filtered"
    }
}
