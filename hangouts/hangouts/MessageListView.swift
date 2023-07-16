//
//  MessageListView.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct MessageListView: View {
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
                VStack(spacing: 20) {
                    ForEach(0..<10) { _ in // Replace with your data model here
                        HStack {
                            Circle()
                                .frame(width: 40)
                                .clipped()
                                .padding(.trailing)
                            VStack {
                                Text("Jean Denis")
                                    .font(.system(.title2, design: .monospaced))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .clipped()
                                    .padding(.bottom, 5)
                                Text("Lorem ipsum lolorem oke…")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .clipped()
                                    .font(.system(.body, design: .monospaced))
                            }
                            .background {
                                Group {
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .clipped()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 40, style: .continuous)
                                .stroke(Color(.quaternaryLabel), lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 40, style: .continuous).fill(Color(.systemBackground)))
                        }
                    }
                    .multilineTextAlignment(.leading)
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

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
