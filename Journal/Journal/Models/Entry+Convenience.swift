//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Carlos E. Alvarez-Berrios on 4/25/24.
//

import Foundation
import CoreData

enum Mood: String, CaseIterable {
    case happy = "😀"
    case neutral = "😐"
    case sad = "😞"
}

extension Entry {
    @discardableResult convenience init(id: String = UUID().uuidString, title: String, mood: Mood, bodyText: String, timeStamp: Date = Date(), context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = id
        self.title = title
        self.mood = mood.rawValue
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
}
