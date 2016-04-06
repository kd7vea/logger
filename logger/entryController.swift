//
//  entryController.swift
//  logger
//
//  Created by Jake Estepp on 3/30/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//


import Foundation

class Entry: Equatable {
    
    private let callSignKey = "call"
    private let timeKey = "timestamp"
    private let bandKey = "band"
    private let frequencyKey = "frequency"
    private let contestKey = "contest"
    private let arrlSectKey = "arrlSect"
    private let arrlClassKey = "arrlClass"
    private let modeKey = "mode"
    private let powerKey = "power"
    private let txRstKey = "txRst"
    private let rxRstKey = "rxRst"
    private let infoTxKey = "infoTx"
    private let txSerialKey = "txSerial"
    private let infoRxKey = "infoRx"
    private let rxSerialKey = "rxSerial"
    private let commentsKey = "comments"
    
    var call:String
    var timestamp: NSDate
    var band: String
    var frequency: String
    var contest:String
    var arrlSect:String
    var arrlClass:String
    var mode:String
    var power:String
    var txRst:String
    var rxRst:String
    var infoTx:String
    var txSerial:String
    var infoRx:String
    var rxSerial:String
    var comments:String
    
    
    init(call: String, timestamp: NSDate = NSDate(), band: String, frequency: String, contest: String, arrlSect: String, arrlClass: String, mode: String, power: String, txRst: String, rxRst: String, infoTx: String, txSerial: String, infoRx: String, rxSerial: String, comments: String) {
        
        self.call = call
        self.timestamp = timestamp
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
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let call = dictionary[callSignKey] as? String,
            let timestamp = dictionary[timeKey] as? NSData,
            let band = dictionary[bandKey] as? String,
            let frequency = dictionary[frequencyKey] as? String,
            let _ = dictionary[contestKey] as? String,
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
        self.timestamp = timestamp
        self.band = band
        self.frequency = frequency
        
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        
        let dictionary = [
            calllSignKey : self.timestamp,
            titleKey : self.title,
            textKey : self.text
        ]
        
        return dictionary
    }
    
}

func == (lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}