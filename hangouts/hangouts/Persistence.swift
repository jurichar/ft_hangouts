//
//  Persistence.swift
//  hangouts
//
//  Created by Julien Richard on 14/07/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "hangouts")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func saveMessage(sender: String, content: String){
        let newMessage = Message(context: container.viewContext)
        newMessage.content = content
        newMessage.sender = sender
    }
    
    func saveContact(name: String, surname: String, number: String) {
        let newContact = Contact(context: container.viewContext)
        newContact.name = name
        newContact.surname = surname
        newContact.number = number

        save()
    }
    
    func delete(contact: Contact) {
        container.viewContext.delete(contact)
        
        save()
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
