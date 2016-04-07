//
//  LogBookTableViewCell.swift
//  logger
//
//  Created by Jake Estepp on 4/6/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//

import UIKit

class LogBookTableViewCell: UITableViewCell {

    @IBOutlet weak var comments: UITextView!
    @IBOutlet weak var frequency: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var callSign: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
