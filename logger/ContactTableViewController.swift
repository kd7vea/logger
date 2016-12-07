
//
//  ContactTableViewController.swift
//  logger
//
//  Created by Jake Estepp on 3/25/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//

import UIKit
import CoreData

class ContactTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{

    var logEntry: LogEntry?
    let dateFormatter = DateFormatter()

    
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
   
    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        updateLog()
        clearTextFields()
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func textFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ContactTableViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    func datePickerValueChanged(_ sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' HH:mm"
        qsoTimeTextField.text = dateFormatter.string(from: sender.date)
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
    
    var bandOption = ["2190 M", "636 M", "560 M", "160 M", "80 M", "60 M", "40 M","30 M", "20 M", "17 M", "15 M", "12 M", "10 M", "6 M", "4 M" , "2 M", "1.25", "70 CM", "33 CM", "23 CM", "13 CM", "9 CM", "6 CM", "3 CM", "1.25 CM", "6 MM", "4 MM", "2.5 MM", "2 MM", "1 MM"]
    
    var modeOptions = ["SSB","CW"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let bandPickerView = UIPickerView()
        bandPickerView.delegate = self
        bandTextField.inputView = bandPickerView
        
    // toolbar for Buttons on Date picker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.darkGray
        
        let nowBtn = UIBarButtonItem(title: "NOW", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ContactTableViewController.tappedToolBarBtn))
        let okBarBtn = UIBarButtonItem(title: "CLOSE", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ContactTableViewController.donePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        label.font = UIFont(name: "Helvetica", size: 24)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.text = "QSO time"
        label.textAlignment = NSTextAlignment.center
        let textBtn = UIBarButtonItem(customView: label)
        toolBar.setItems([nowBtn,flexSpace,textBtn,flexSpace,okBarBtn], animated: true)
        qsoTimeTextField.inputAccessoryView = toolBar

    //number pad  done button
        let doneToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        doneToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        doneToolBar.barStyle = UIBarStyle.default
        doneToolBar.tintColor = UIColor.white
        doneToolBar.backgroundColor = UIColor.darkGray
        let doneBtn = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ContactTableViewController.numberDonePressed))
        doneToolBar.setItems([doneBtn], animated: true)
        frequencyTextField.inputAccessoryView = doneToolBar
        powerTextField.inputAccessoryView = doneToolBar
        txRstTextField.inputAccessoryView = doneToolBar
        rxRstTextField.inputAccessoryView = doneToolBar

    //PickerView select buttons
        let pickerToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        pickerToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        pickerToolBar.barStyle = UIBarStyle.default
        pickerToolBar.tintColor =  UIColor.white
        pickerToolBar.backgroundColor = UIColor.darkGray
        let selectButton = UIBarButtonItem(title: "SELECT", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ContactTableViewController.selectPressed))
        pickerToolBar.setItems([selectButton], animated: true)
        bandTextField.inputAccessoryView = pickerToolBar
     
    // log input setup
        
        self.callSignTextField.delegate = self
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
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
    }
    
    //BandPickerView Functions
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return bandOption.count
        }
    
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return bandOption[row]
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            bandTextField.text = bandOption[row]
        }

       
    //Done Button for Number Pads to close the Keypad
    func numberDonePressed(_ sender :UIBarButtonItem){
        frequencyTextField.resignFirstResponder()
        powerTextField.resignFirstResponder()
        txRstTextField.resignFirstResponder()
        rxRstTextField.resignFirstResponder()
    }
    
    //Select Button for Pickers to close the picker view after selection is made
    func selectPressed(_ sender :UIBarButtonItem){
        bandTextField.resignFirstResponder()
    }
    
    //closes the DatePicker
    func donePressed(_ sender: UIBarButtonItem) {
        qsoTimeTextField.resignFirstResponder()
        }
    
   // Selects theh date from the picker
    func tappedToolBarBtn(_ sender: UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' HH:mm"
        qsoTimeTextField.text = dateFormatter.string(from: Date())
        qsoTimeTextField.resignFirstResponder()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    //Sends the data from the text fields to the Log in core data
    func updateWithLogEntry(_ logEntry: LogEntry) {
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
    
    func textFieldShouldReturn(_ userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    
    
    func textViewShouldReturn(_ userText: UITextView) -> Bool {
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
    
    func saveButtonTapped(_ sender: LogBookTableViewCell) {
        tableView.reloadData()
    }
}




