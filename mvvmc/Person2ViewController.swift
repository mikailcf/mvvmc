//
//  Person2ViewController.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import UIKit

class Person2ViewController: UIViewController {
    @IBOutlet fileprivate var nicknameLabel: UILabel!

    fileprivate var delegate: PersonDetailDelegate? = nil
    fileprivate var datasource: PersonDetailDatasource? = nil
}
