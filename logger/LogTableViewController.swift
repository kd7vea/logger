//
//  LogTableViewController.swift
//  logger
//
//  Created by Jake Estepp on 4/4/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//

import UIKit


class LogTableViewController: UITableViewController {

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
 
    override func viewDidAppear(animated: Bool) {
        
        tableView.reloadData()
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return entryController.sharedController.logEntry.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("logCell") as? LogBookTableViewCell
        let logEntry = entryController.sharedController.logEntry[indexPath.row]
        cell?.callSignTextField.text = logEntry.callSign
        cell?.timeTextField.text = logEntry.qsoTime
        cell?.frequencyTextField.text = logEntry.frequency
        cell?.commentsTextField.text = logEntry.comments
        cell?.updateWithLogEntry(logEntry)
        return cell!
        
    }

                                                
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
        
        let logEntry = entryController.sharedController.logEntry[indexPath.row]
        entryController.sharedController.removeLogEntry(logEntry)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

 
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "viewLogDetail" {
            
            let destinationViewController = segue.destinationViewController as? ContactTableViewController
            
            if let ContactTableViewController = destinationViewController {
                
                // force the destination view controller to draw all subviews for updating
                _ = ContactTableViewController.view
                
                if let selectedRow = tableView.indexPathForSelectedRow?.row {
                    ContactTableViewController.updateWithLogEntry(entryController.sharedController.logEntry[selectedRow])
                }
            }
        }
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

