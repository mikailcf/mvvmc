//
//  ViewController.swift
//  mvvmc
//
//  Created by Mikail on 12/14/16.
//  Copyright © 2016 Mikail. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    private var delegate: FirstViewDelegate? = nil

    init(delegate: FirstViewDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Actions

    @IBAction func peopleListButtonClick() {
        delegate?.showPeopleList()
    }
}
