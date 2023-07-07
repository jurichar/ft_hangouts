//
//  ContactProvider.swift
//  ft_hangouts
//
//  Created by Julien Richard on 07/07/2023.
//

import Foundation
import CoreData

final class ContactsProvider {
    static let shared = ContactsProvider()
    
    private let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init (){
        persistentContainer = NSPersistentContainer(name: "ContactsData")
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load store with error : \(error)")
            }
        }
    }
}
