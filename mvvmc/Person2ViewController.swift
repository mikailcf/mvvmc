//
//  Person2ViewController.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import UIKit

class Person2ViewController: UIViewController, Person2Feedback {

    private static let storyboardName = "Person2"
    private static let viewControllerName = "Person2ViewController"

    @IBOutlet private var nicknameLabel: UILabel!

    private var delegate: PersonDelegate? = nil
    private var datasource: PersonDataSource? = nil

    static func fromStoryboard(delegate: PersonDelegate, datasource: PersonDataSource) -> Person2ViewController? {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName) as? Person2ViewController else { return nil }
        viewController.delegate = delegate
        viewController.datasource = datasource

        return viewController
    }

    override func viewDidLoad() {
        nicknameLabel.text = datasource?.nickname ?? ""

        super.viewDidLoad()
    }

    @IBAction func changeNickname() {
        delegate?.changeNickname(feedback: self)
    }

    // MARK: Person2Feedback

    func didChangeNickname() {
        nicknameLabel.text = datasource?.nickname ?? ""
    }
}
