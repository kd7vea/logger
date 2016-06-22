//
//  LogEntry+CoreDataProperties.swift
//  logger
//
//  Created by Jake Estepp on 4/6/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension LogEntry {

    @NSManaged var arrlClass: String?
    @NSManaged var arrlSect: String?
    @NSManaged var band: String?
    @NSManaged var callSign: String?
    @NSManaged var comments: String?
    @NSManaged var contest: String?
    @NSManaged var frequency: String?
    @NSManaged var infoRx: String?
    @NSManaged var infoTx: String?
    @NSManaged var mode: String?
    @NSManaged var power: String?
    @NSManaged var qsoTime: String?
    @NSManaged var rxRst: String?
    @NSManaged var rxSerial: String?
    @NSManaged var txRst: String?
    @NSManaged var txSerial: String?

}
