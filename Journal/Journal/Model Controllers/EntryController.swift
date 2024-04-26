//
//  EntryController.swift
//  Journal
//
//  Created by Carlos E. Alvarez-Berrios on 4/25/24.
//

import Foundation
import CoreData

class EntryController {
    func createEntry(with title: String, body: String, context: NSManagedObjectContext) {
        
        Entry(title: title, bodyText: body, context: context)
        CoreDataStack.shared.saveToPersistentStore()
    }
    
    func updateEntry(entry: Entry, with title: String, body: String) {
        entry.title = title
        entry.bodyText = body
        CoreDataStack.shared.saveToPersistentStore()
    }
    
    func deleteEntry(entry: Entry, context: NSManagedObjectContext) {
        do {
            context.delete(entry)
            try context.save()
        } catch {
            NSLog("Error deleting Entry: \(error)")
        }
    }
    
}
