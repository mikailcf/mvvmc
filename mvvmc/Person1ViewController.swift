//
//  Person1ViewController.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import UIKit

class Person1ViewController: UIViewController, Person1Feedback {

    private static let storyboardName = "Person1"
    private static let viewControllerName = "Person1ViewController"

    @IBOutlet private var fullNameLabel: UILabel!
    @IBOutlet private var cpfLabel: UILabel!

    private var delegate: PersonDelegate? = nil
    private var datasource: PersonDataSource? = nil
    private var indexToLoad: Int? = nil

    static func fromStoryboard(indexToLoad: Int, delegate: PersonDelegate, datasource: PersonDataSource) -> Person1ViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName) as? Person1ViewController else { return nil }
        viewController.delegate = delegate
        viewController.datasource = datasource
        viewController.indexToLoad = indexToLoad

        return viewController
    }

    override func viewDidLoad() {
        if let indexToLoad = indexToLoad {
            delegate?.loadPerson(index: indexToLoad, feedback: self)
        }

        super.viewDidLoad()
    }

    @IBAction private func showNextDetails() {
        delegate?.showNextDetails()
    }

    @IBAction private func changeFirstName() {
        delegate?.changeFirstName(feedback: self)
    }

    // MARK: Person1Feedback

    func didLoadPerson(error: DataError?) {
        if let error = error {
            // deal with error
        } else {
            fullNameLabel.text = datasource?.fullName ?? ""
            cpfLabel.text = datasource?.cpf ?? ""
        }
    }

    func didChangeFirstName() {
        fullNameLabel.text = datasource?.fullName ?? ""
    }
}
