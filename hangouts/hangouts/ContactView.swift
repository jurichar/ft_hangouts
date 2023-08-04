//
//  ContactView.swift
//  hangouts
//
//  Created by Julien Richard on 18/07/2023.
//


import SwiftUI
import CoreData

struct ContactView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var contactSurname: String
    @State private var contactName: String
    @State private var contactPhoneNumber: String
    
    public var selectedContact: Contact?
    
    init(selectedContact: Contact? = nil) {
        _contactSurname = State(initialValue: selectedContact?.surname ?? "")
        _contactName = State(initialValue: selectedContact?.name ?? "")
        _contactPhoneNumber = State(initialValue: selectedContact?.number ?? "")
        
        self.selectedContact = selectedContact
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Hangouts")
                    .font(.system(.largeTitle, design: .monospaced, weight: .ultraLight))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                Button(action: {
                    deleteContact()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "trash")
                        .imageScale(.large)
                        .symbolRenderingMode(.monochrome)
                        .accentColor(.primary) // Use the primary color for the icon
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding()
                .clipped()
            VStack {
                Circle()
                    .frame(width: 100, alignment: .center)
                    .clipped()
                    .padding(40)
                VStack {
                    TextField("Surname", text: $contactSurname)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .keyboardType(.alphabet)
                    TextField("Name", text: $contactName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .keyboardType(.alphabet)
                    TextField("Number", text: $contactPhoneNumber)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .keyboardType(.phonePad)
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    saveContact()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("save")
                        .font(.system(.title2, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .bottom)
                        .clipped()
                        .padding(25)
                        .background {
                            RoundedRectangle(cornerRadius: 40, style: .continuous)
                                .fill(Color(.systemFill))
                                .padding(10)
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .clipped()
            .background {
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .stroke(Color(.quaternaryLabel), lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 40, style: .continuous).fill(Color(.systemBackground)))
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
        .padding(.all, 20)
        .overlay(alignment: .top) {
            Group {
                
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .fill(Color(.systemBackground))
        }
    }
    
    func saveContact() {
        if let existingContact = selectedContact {
            // Update the existing contact
            print("Mise à jour du contact existant")
            PersistenceController.shared.updateContact(contact: existingContact, name: contactName, surname: contactSurname, number: contactPhoneNumber)
        } else {
            // Create a new contact
            print("Création d'un nouveau contact")
            PersistenceController.shared.saveContact(name: contactName, surname: contactSurname, number: contactPhoneNumber)
        }
        presentationMode.wrappedValue.dismiss()
    }
    
    func deleteContact() {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", contactName)
        
        do {
            let fetchedContacts = try viewContext.fetch(fetchRequest)
            if let contact = fetchedContacts.first {
                PersistenceController.shared.deleteContact(contact: contact)
            }
        } catch {
            print("Erreur lors de la recherche du contact : \(error)")
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}
