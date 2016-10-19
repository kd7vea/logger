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
    
    fileprivate let LogKey = "logs"
    
    static let sharedController = entryController()
    
       
    var logEntry:[LogEntry] {
        
        let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "LogEntry")
        
        do {
            return try Stack.sharedStack.managedObjectContext.fetch(request) as! [LogEntry]
        } catch {
            return []
        }
    }
    
    func addLog(_ logEntry: LogEntry) {
        
        saveToPersistentStorage()
    }
    
    func removeLogEntry(_ logEntry: LogEntry) {
        
        logEntry.managedObjectContext?.delete(logEntry)
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
    
    func filePath(_ key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0] as AnyObject
        let entriesPath = documentsPath.appending("/\(key).plist")
        
        return entriesPath
    }
}









