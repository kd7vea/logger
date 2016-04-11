//
//  entryController.swift
//  logger
//
//  Created by Jake Estepp on 3/30/16.
//  Copyright © 2016 Jake Estepp. All rights reserved.
//


import Foundation
import CoreData

   // @objc(Task)
    class entry: NSManagedObject {
       
        var logEntry:[LogEntry] {
            
            let request = NSFetchRequest(entityName: "LogEntry")
            
            do {
                return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [LogEntry]
            } catch {
                return []
            }
        }

        
       
        
        
       //connect this func to the save buton !!
        
        
        func addEntry(logEntry: LogEntry) {
            
            saveToPersistentStorage()
        }
        
        func removeEntry(logEntry: LogEntry) {
            
            logEntry.managedObjectContext?.deleteObject(logEntry)
            saveToPersistentStorage()
        }
        
        // MARK: - Persistence
        
        func saveToPersistentStorage() {
            
            do {
                try Stack.sharedStack.managedObjectContext.save()
            } catch {
                print("Error saving Managed Object Context. Entry not saved.")
            }
        }
 
        
        
    }

    
    

