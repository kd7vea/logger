//
//  LogBookTableViewCell.swift
//  logger
//
//  Created by Jake Estepp on 4/6/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//


import UIKit

class LogBookTableViewCell: UITableViewCell {
    
    var logEntry: LogEntry?

    @IBOutlet weak var commentsTextField: UITextView!
    @IBOutlet weak var frequencyTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var callSignTextField: UITextField!
    
    var delegate: LogBookTableViewCell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateWithLogEntry(logEntry: LogEntry) {
        self.logEntry = logEntry
    }
    
}

extension LogBookTableViewCell {
        
        func UpdateWithLogEntry(logEntry: LogEntry) {
            
            callSignTextField.text = logEntry.callSign
        }
    }
