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
    
    func updateContact(contact: Contact, name: String, surname: String, number: String) {
        contact.name = name
        contact.surname = surname
        contact.number = number

        save()
    }
    
    func deleteContact(contact: Contact) {
        container.viewContext.delete(contact)
        
        save()
    }
    
    func saveContact(name: String, surname: String, number: String) {
        let newContact = Contact(context: container.viewContext)
        newContact.name = name
        newContact.surname = surname
        newContact.number = number

        save()
    }
    
    func saveMessage(content: String, from contact: Contact) {
        let newMessage = Message(context: container.viewContext)
        newMessage.content = content
        newMessage.date = Date()
        newMessage.contact = contact
        
        save()
    }
    
    func deleteMessage(message: Message) {
        container.viewContext.delete(message)
        
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
