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
        VStack {
            HStack {
                Text("Hangouts")
                    .font(.system(.largeTitle, design: .monospaced, weight: .ultraLight))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                Image(systemName: "plus")
                    .imageScale(.large)
                    .symbolRenderingMode(.monochrome)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .padding()
                .frame()
                .clipped()
            ScrollView {
                VStack {
                    ForEach(0..<5) { _ in // Replace with your data model here
                        HStack {
                            HStack {
                                Circle()
                                    .frame(width: 40)
                                    .clipped()
                                Text("Jean Denis")
                                    .font(.system(.title2, design: .monospaced))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            Image(systemName: "pencil")
                                .imageScale(.large)
                                .symbolRenderingMode(.monochrome)
                                .padding(.leading, 0)
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
            Divider()
            HStack(spacing: 0) {
                ForEach(0..<2) { _ in // Replace with your data model here
                    VStack(spacing: 10) {
                        Image(systemName: "paperplane")
                        Text("Hello, World!")
                            .font(.system(.body, design: .monospaced))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .clipped()
                    .padding(.top)
                }
            }
            .frame(maxWidth: .infinity)
            .clipped()
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .padding(.horizontal, 20)
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

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
