//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Carlos E. Alvarez-Berrios on 4/25/24.
//

import Foundation
import CoreData

extension Entry {
    @discardableResult convenience init(id: String = UUID().uuidString, title: String, bodyText: String, timeStamp: Date = Date(), context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = id
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
}
