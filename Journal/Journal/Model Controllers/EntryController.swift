//
//  EntryController.swift
//  Journal
//
//  Created by Carlos E. Alvarez-Berrios on 4/25/24.
//

import Foundation
import CoreData

class EntryController {
    func createEntry(with title: String, mood: Mood, body: String, context: NSManagedObjectContext) {
        
        Entry(title: title, mood: mood, bodyText: body, context: context)
        CoreDataStack.shared.saveToPersistentStore()
    }
    
    func updateEntry(entry: Entry, with title: String, mood: Mood, body: String) {
        entry.title = title
        entry.mood = mood.rawValue
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
