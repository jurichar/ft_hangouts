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

    @State private var contactName: String
    @State private var contactPhoneNumber: String
    @State private var contactEmail: String

    init(selectedContact: Contact? = nil) {
        _contactName = State(initialValue: selectedContact?.name ?? "")
        _contactPhoneNumber = State(initialValue: selectedContact?.number ?? "")
        _contactEmail = State(initialValue: selectedContact?.surname ?? "")
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
                    TextField("Nom", text: $contactName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    TextField("Numéro de téléphone", text: $contactPhoneNumber)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .keyboardType(.phonePad)
                    TextField("Email", text: $contactEmail)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .keyboardType(.emailAddress)
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
        PersistenceController.shared.saveContact(name: contactName, surname: contactEmail, number: contactPhoneNumber)
        presentationMode.wrappedValue.dismiss()
    }
    
    func deleteContact() {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", contactName)

        do {
            let fetchedContacts = try viewContext.fetch(fetchRequest)
            if let contact = fetchedContacts.first {
                PersistenceController.shared.delete(contact: contact)
            }
        } catch {
            print("Erreur lors de la recherche du contact : \(error)")
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
