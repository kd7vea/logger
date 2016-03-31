//
//  ContactTableViewController.swift
//  logger
//
//  Created by Jake Estepp on 3/25/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//

import UIKit
import CoreData

class ContactTableViewController: UITableViewController {

        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var callSign: UITextField!
    @IBOutlet weak var qsoTime: UITextField!
    @IBOutlet weak var band: UITextField!
    @IBOutlet weak var frequency: UITextField!
    @IBOutlet weak var contest: UITextField!
    @IBOutlet weak var arrlSect: UITextField!
    @IBOutlet weak var arrlClass: UITextField!
    @IBOutlet weak var mode: UITextField!
    @IBOutlet weak var power: UITextField!
    @IBOutlet weak var txRst: UITextField!
    @IBOutlet weak var rxRst: UITextField!
    @IBOutlet weak var infoTx: UITextField!
    @IBOutlet weak var txSerial: UITextField!
    @IBOutlet weak var infoRx: UITextField!
    @IBOutlet weak var rxSerial: UITextField!
    @IBOutlet weak var comments: UITextView!
    
    
    @IBAction func saveButton(sender: AnyObject) {
        let appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let NSManagedObjectContext = appDel.managedObjectContext
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }
    
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("callCell", forIndexPath: indexPath)
    
        
        if indexPath.row == 0 {
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "callCell")
            return cell
        } else if indexPath.row == 1 {
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "timeCell")
            return cell
        } else if indexPath.row == 2 {
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "bandCell")
            return cell
        } else if indexPath.row == 3 {
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "contestCell")
            return cell
        } else if indexPath.row == 4 {
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "modeCell")
            return cell
        } else if indexPath.row == 5 {
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "infoTxCell")
            return cell
        } else if indexPath.row == 6 {
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "infoRxCell")
            return cell
        } else if indexPath.row == 7 {
            let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "commentCell")
            return cell
        }

    }
        
        
        
        
    /*
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("callCell")!
            return cell
        } else if indexPath.row == 1 {
           let cell = tableView.dequeueReusableCellWithIdentifier("timeCell")!
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("bandCell")!
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("contestCell")!
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("modeCell")!
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCellWithIdentifier("infoTxCell")!
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCellWithIdentifier("infoRxCell")!
            return cell
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCellWithIdentifier("commentCell")!
            return cell
        }
    }
*/
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