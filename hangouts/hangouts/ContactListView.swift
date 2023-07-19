//
//  ContactListView.swift
//  hangouts
//
//  Created by Julien Richard on 18/07/2023.
//

import SwiftUI

struct ContactListView: View {
    @FetchRequest(entity: Contact.entity(), sortDescriptors: []) var contacts: FetchedResults<Contact>

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Hangouts")
                        .font(.system(.largeTitle, design: .monospaced, weight: .ultraLight))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    NavigationLink(destination: ContactView()) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .symbolRenderingMode(.monochrome)
                }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding()
                    .clipped()
                ScrollView {
                    VStack {
                        ForEach(contacts, id: \.self) { contact in
                            HStack {
                                NavigationLink(destination: MessageView(), label: {
                                    HStack {
                                        Circle()
                                            .frame(width: 40)
                                            .clipped()
                                        Text("\(contact.name ?? "") \(contact.surname ?? "")")
                                            .font(.system(.title2, design: .monospaced))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    })
                                    .clipped()
                                    NavigationLink(destination: ContactView(selectedContact: contact)) {
                                        Image(systemName: "pencil")
                                            .imageScale(.large)
                                            .symbolRenderingMode(.monochrome)
                                            .padding(.leading, 0)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .background {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .stroke(Color(.quaternaryLabel), lineWidth: 1)
                                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color(.systemBackground)))
                            }
                        }
                        .multilineTextAlignment(.trailing)
                       }
                    }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(.all, 20)
            }
            .background {
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color(.systemBackground))
            }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
