//
//  Person1ViewController.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import UIKit

class Person1ViewController: UIViewController {
    @IBOutlet fileprivate var fullNameLabel: UILabel!
    @IBOutlet fileprivate var cpfLabel: UILabel!

    fileprivate var delegate: PersonDetailDelegate? = nil
    fileprivate var datasource: PersonDetailDatasource? = nil

    @IBAction private func showNextDetails() {
        delegate.showNextDetails()
    }
}
