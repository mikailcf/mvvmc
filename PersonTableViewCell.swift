//
//  PersonTableViewCell.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    private static let nibName: String = "PersonTableViewCell"
    static let cellID: String = "PersonTableViewCellID"

    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    static func nib() -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }

    static func minHeight() -> CGFloat {
        return 60.0
    }

    func setup(person: Person) {
        self.fullNameLabel.text = "\(person.firstName) \(person.lastName)"

        let dateFormat = "dd/MM/yyyy HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        self.dateLabel.text = dateFormatter.string(from: person.birthDate)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
