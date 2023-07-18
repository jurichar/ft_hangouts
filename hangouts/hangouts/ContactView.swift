//
//  ContactView.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct ContactView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Text("Hangouts")
                    .font(.system(.largeTitle, design: .monospaced, weight: .ultraLight))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                Button(action: {
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
                    .frame(width: 80, alignment: .center)
                    .clipped()
                    .padding(40)
                VStack {
                    ForEach(0..<3) { _ in // Replace with your data model here
                        Text("Jean")
                            .font(.system(.title2, design: .monospaced))
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .clipped()
                            .background {
                                RoundedRectangle(cornerRadius: 40, style: .continuous)
                                    .stroke(Color(.quaternaryLabel), lineWidth: 1)
                                    .background(RoundedRectangle(cornerRadius: 40, style: .continuous).fill(Color(.systemBackground)))
                            }
                            .padding(.horizontal)
                    }
                }
                Button(action: {
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
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
