//
//  MessageView.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hangouts")
                    .font(.system(.largeTitle, design: .monospaced, weight: .ultraLight))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .symbolRenderingMode(.monochrome)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .padding()
                .frame()
                .clipped()
            HStack {
                Text("Jean Denis")
                    .font(.system(.title2, design: .monospaced))
                    .frame(maxWidth: .infinity)
                    .clipped()
            }
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<5) { _ in // Replace with your data model here
                        HStack {
                            Circle()
                                .frame(width: 40)
                                .clipped()
                                .padding(.trailing)
                            Text("Lorem ipsum lolorem owokke… popow;l'wkpokokpko")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .font(.system(.body, design: .monospaced))
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
                    ForEach(0..<5) { _ in // Replace with your data model here
                        HStack {
                            Text("Lorem ipsum lolorem oke…")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .font(.system(.body, design: .monospaced))
                            Circle()
                                .frame(width: 40)
                                .clipped()
                                .padding(.leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 40, style: .continuous)
                                .stroke(Color(.quaternaryLabel), lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 40, style: .continuous).fill(Color(.secondarySystemBackground)))
                        }
                    }
                    .multilineTextAlignment(.leading)
                }
            }
            Divider()
                .padding(10)
            HStack {
                Rectangle()
                    .stroke(Color(.quaternaryLabel), lineWidth: 0)
                    .background(Rectangle().fill(Color(.quaternaryLabel)))
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .bottom)
                    .clipped()
                    .mask { RoundedRectangle(cornerRadius: 40, style: .continuous) }
                Image(systemName: "paperplane")
                    .imageScale(.large)
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(10)
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .padding(.horizontal, 20)
        .background {
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .stroke(.clear, lineWidth: 0)
                .background(RoundedRectangle(cornerRadius: 0, style: .continuous).fill(Color(.systemBackground)))
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
