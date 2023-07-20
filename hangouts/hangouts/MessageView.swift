//
//  MessageView.swift
//  hangouts
//
//  Created by Julien Richard on 18/07/2023.
//


import SwiftUI

struct MessageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var inputMessage: String = ""

    var body: some View {
        VStack {
            HStack {
                Text("Messages")
                    .font(.system(.largeTitle, design: .monospaced, weight: .ultraLight))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .symbolRenderingMode(.monochrome)
                        .accentColor(.primary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .padding()
                .clipped()
            HStack {
                Text("Jean Denis")
                    .font(.system(.title2, design: .monospaced))
                    .frame(maxWidth: .infinity)
                    .clipped()
            }
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<5) { _ in
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
                TextField("Ecrire un message...", text: $inputMessage)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemGray5)))
                Image(systemName: "paperplane")
                    .imageScale(.large)
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(10)
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .padding(.all, 20)
        .background {
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .stroke(.clear, lineWidth: 0)
                .background(RoundedRectangle(cornerRadius: 0, style: .continuous).fill(Color(.systemBackground)))
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
