//
//  entryController.swift
//  logger
//
//  Created by Jake Estepp on 3/30/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//


import Foundation
import CoreData

class entryController {
    
    private let LogKey = "logs"
    
    static let sharedController = entryController()
    
       
    var logEntry:[LogEntry] {
        
        let request = NSFetchRequest(entityName: "LogEntry")
        
        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [LogEntry]
        } catch {
            return []
        }
    }
    
    func addLog(logEntry: LogEntry) {
        
        saveToPersistentStorage()
    }
    
    func removeLogEntry(logEntry: LogEntry) {
        
        logEntry.managedObjectContext?.deleteObject(logEntry)
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
}









