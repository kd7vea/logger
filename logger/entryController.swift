//
//  entryController.swift
//  logger
//
//  Created by Jake Estepp on 3/30/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//


import Foundation
import CoreData

    @objc(Task)
    class entry: NSManagedObject {
        
    }

    
    
       
   /*
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let call = dictionary[callSignKey] as? String,
            let timestamp = dictionary[timeKey] as? NSData,
            let band = dictionary[bandKey] as? String,
            let frequency = dictionary[frequencyKey] as? String,
            let contest = dictionary[contestKey] as? String,
            let arrlSect = dictionary[arrlSectKey] as? String,
            let arrlClass = dictionary[arrlClassKey] as? String,
            let mode = dictionary[modeKey] as? String,
            let power = dictionary[powerKey] as? String,
            let txRst = dictionary[txRstKey] as? String,
            let rxRst = dictionary[rxRstKey] as? String,
            let infoTx = dictionary[infoTxKey] as? String,
            let txSerial = dictionary[txSerialKey] as? String,
            let infoRx = dictionary[infoRxKey] as? String,
            let rxSerial = dictionary[rxSerialKey] as? String,
            let comments = dictionary[commentsKey] as? String
            
            else {
                
                // sets values for stored properties due to requirement as of Swift 2.0
                self.call = ""
                self.timestamp = NSDate()
                self.band = ""
                self.frequency = ""
                self.contest = ""
                self.arrlSect = ""
                self.arrlClass = ""
                self.mode = ""
                self.power = ""
                self.txRst = ""
                self.rxRst = ""
                self.infoTx = ""
                self.txSerial = ""
                self.infoRx = ""
                self.rxSerial = ""
                self.comments = ""

                
                return nil
        }
 
        self.call = call
        self.timestamp = NSDate()
        self.band = band
        self.frequency = frequency
        self.contest = contest
        self.arrlSect = arrlSect
        self.arrlClass = arrlClass
        self.mode = mode
        self.power = power
        self.txRst = txRst
        self.rxRst = rxRst
        self.infoTx = infoTx
        self.txSerial = txSerial
        self.infoRx = infoRx
        self.rxSerial = rxSerial
        self.comments = comments
        }
 */

