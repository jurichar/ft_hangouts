//
//  MessageListView.swift
//  hangouts
//
//  Created by Julien Richard on 18/07/2023.
//

import SwiftUI
import CoreData

struct MessageListView: View {
    @FetchRequest(entity: Contact.entity(), sortDescriptors: []) var contacts: FetchedResults<Contact>

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Hangouts")
                        .font(.system(.largeTitle, design: .monospaced, weight: .ultraLight))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding()
                    .clipped()
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(contacts, id: \.self) { contact in
                            NavigationLink(destination: MessageView(contact: contact)) {
                                HStack {
                                    Circle()
                                        .frame(width: 40)
                                        .clipped()
                                        .padding(.trailing)
                                    VStack {
                                        Text("\(contact.surname ?? "")")
                                            .font(.system(.title2, design: .monospaced))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .clipped()
                                            .padding(.bottom, 5)
                                        Text(contact.name ?? "")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .clipped()
                                            .font(.system(.body, design: .monospaced))
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .clipped()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(Color(.quaternaryLabel), lineWidth: 2)
                                        .background(RoundedRectangle(cornerRadius: 40, style: .continuous).fill(Color(.systemBackground)))
                                }
                            }
                            .accentColor(.primary) // Use the primary color for the icon

                        }
                        .multilineTextAlignment(.leading)
                    }
                }
            }
            .frame(maxWidth: .infinity)
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
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
