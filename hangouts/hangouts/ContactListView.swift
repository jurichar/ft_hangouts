//
//  ContactListView.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct ContactListView: View {
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
                        ForEach(0..<5) { _ in // Replace with your data model here
                            HStack {
                                NavigationLink(destination: MessageView(), label: {
                                    HStack {
                                        Circle()
                                            .frame(width: 40)
                                            .clipped()
                                        Text("Jean Denis")
                                            .font(.system(.title2, design: .monospaced))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    })
                                    .clipped()
                                    NavigationLink(destination: ContactView()) {
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
