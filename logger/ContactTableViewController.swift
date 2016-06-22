//
//  ContactTableViewController.swift
//  logger
//
//  Created by Jake Estepp on 3/25/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//

import UIKit
import CoreData

class ContactTableViewController: UITableViewController, UITextFieldDelegate {

    var logEntry: LogEntry?
    let dateFormatter = NSDateFormatter()

    
    @IBOutlet weak var callSignTextField: UITextField!
    @IBOutlet weak var qsoTimeTextField: UITextField!
    @IBOutlet weak var bandTextField: UITextField!
    @IBOutlet weak var frequencyTextField: UITextField!
    @IBOutlet weak var contestTextField: UITextField!
    @IBOutlet weak var arrlSectTextField: UITextField!
    @IBOutlet weak var arrlClassTextField: UITextField!
    @IBOutlet weak var modeTextField: UITextField!
    @IBOutlet weak var powerTextField: UITextField!
    @IBOutlet weak var txRstTextField: UITextField!
    @IBOutlet weak var rxRstTextField: UITextField!
    @IBOutlet weak var infoTxTextField: UITextField!
    @IBOutlet weak var txSerialTextField: UITextField!
    @IBOutlet weak var infoRxTextField: UITextField!
    @IBOutlet weak var rxSerialTextField: UITextField!
    @IBOutlet weak var commentsTextView: UITextView!
   
    @IBAction func saveButtonTapped(sender: AnyObject) {
        updateLog()
        clearTextFields()
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func textFieldEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(ContactTableViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
   
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' HH:mm"
        
        qsoTimeTextField.text = dateFormatter.stringFromDate(sender.date)
        
        
        
        //dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
       //dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
       //qsoTimeTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    
    
    
   

    
    func clearTextFields() {
        callSignTextField.text = ""
        qsoTimeTextField.text = ""
        bandTextField.text = ""
        frequencyTextField.text = ""
        contestTextField.text = ""
        arrlSectTextField.text = ""
        arrlClassTextField.text = ""
        modeTextField.text = ""
        powerTextField.text = ""
        txRstTextField.text = ""
        rxRstTextField.text = ""
        infoTxTextField.text = ""
        txSerialTextField.text = ""
        infoTxTextField.text = ""
        rxSerialTextField.text = ""
        commentsTextView.text = ""
    }

    
    
    func updateLog() {
        
        
        let callSign = callSignTextField.text!
        let qsoTime = qsoTimeTextField.text!
        let band = bandTextField.text!
        let frequency = frequencyTextField.text!
        let contest = contestTextField.text!
        let arrlSect = arrlSectTextField.text!
        let arrlClass = arrlClassTextField.text!
        let mode = modeTextField.text!
        let power = powerTextField.text!
        let txRst = txRstTextField.text!
        let rxRst = rxRstTextField.text!
        let infoTx = infoTxTextField.text!
        let txSerial = txSerialTextField.text!
        let infoRx = infoTxTextField.text!
        let rxSerial = rxSerialTextField.text!
        let comments = commentsTextView.text!
     
     
        if let logEntry = self.logEntry {
            logEntry.callSign = callSign
            logEntry.qsoTime = qsoTime
            logEntry.band = band
            logEntry.frequency = frequency
            logEntry.contest = contest
            logEntry.arrlSect = arrlSect
            logEntry.arrlClass = arrlClass
            logEntry.mode = mode
            logEntry.power = power
            logEntry.txRst = txRst
            logEntry.rxRst = rxRst
            logEntry.infoTx = infoTx
            logEntry.txSerial = txSerial
            logEntry.infoRx = infoRx
            logEntry.rxSerial = rxSerial
            logEntry.comments = comments
            
        } else {
        
            let newLog = LogEntry(callSign: callSign, qsoTime: qsoTime, band: band, frequency: frequency, contest: contest, arrlSect: arrlSect, arrlClass: arrlClass, mode: mode, power: power, txRst: txRst, rxRst: rxRst, infoTx: infoTx, txSerial: txSerial, infoRx: infoRx, rxSerial: rxSerial, comments: comments)
            entryController.sharedController.addLog(newLog)
        }
    }
    
    
    
    
   // var calls = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "mapBackground"))
        self.callSignTextField.delegate = self
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        textFieldEditing(qsoTimeTextField)

        self.qsoTimeTextField.delegate = self
        self.bandTextField.delegate = self
        self.frequencyTextField.delegate = self
        self.contestTextField.delegate = self
        self.arrlSectTextField.delegate = self
        self.arrlClassTextField.delegate = self
        self.modeTextField.delegate = self
        self.powerTextField.delegate = self
        self.txRstTextField.delegate = self
        self.rxRstTextField.delegate = self
        self.infoTxTextField.delegate = self
        self.txSerialTextField.delegate = self
        self.infoTxTextField.delegate = self
        self.rxSerialTextField.delegate = self
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithLogEntry(logEntry: LogEntry) {
        self.logEntry = logEntry
        callSignTextField.text = logEntry.callSign
        qsoTimeTextField.text = logEntry.qsoTime
        bandTextField.text = logEntry.band
        frequencyTextField.text = logEntry.frequency
        contestTextField.text = logEntry.contest
        arrlSectTextField.text = logEntry.arrlSect
        arrlClassTextField.text = logEntry.arrlClass
        modeTextField.text = logEntry.mode
        powerTextField.text = logEntry.power
        txRstTextField.text = logEntry.txRst
        rxRstTextField.text = logEntry.rxRst
        infoTxTextField.text = logEntry.infoTx
        txSerialTextField.text = logEntry.txSerial
        infoRxTextField.text = logEntry.infoRx
        rxSerialTextField.text =  logEntry.rxSerial
        commentsTextView.text = logEntry.comments
        
    }
 
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    
    
    func textViewShouldReturn(userText: UITextView) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
     /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LogTableViewController: LogTableViewCellDelegate {
    
    func saveButtonTapped(sender: LogBookTableViewCell) {
        tableView.reloadData()
    }
}




