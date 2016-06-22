//
//  LogEntry.swift
//  logger
//
//  Created by Jake Estepp on 4/6/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//

import Foundation
import CoreData


class LogEntry: NSManagedObject {

    convenience init(callSign: String, qsoTime: NSDate = NSDate(), band: String? = nil, frequency: String? = nil, contest: String? = nil, arrlSect: String? = nil, arrlClass: String? = nil, mode: String? = nil, power: String? = nil, txRst: String? = nil, rxRst: String? = nil, infoTx: String? = nil, txSerial: String? = nil , infoRx: String? = nil, rxSerial: String? = nil, comments: String? = nil,  context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext)  {
        
        let entity = NSEntityDescription.entityForName("LogEntry", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
                
        self.callSign = callSign
        self.qsoTime = qsoTime
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

}
