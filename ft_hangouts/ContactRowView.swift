//
//  ContactRowView.swift
//  ft_hangouts
//
//  Created by Julien Richard on 07/07/2023.
//

import SwiftUI

struct ContactRowView: View {
    var body: some View {
        VStack(alignment: .leading,
        spacing: 8) {
            Text ("Name").font(.system(size: 26, design: .rounded).bold())
            Text ("Email").font(.callout.bold())
            Text ("Number").font(.callout.bold())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(alignment: .topTrailing) {
            Button {
                // TODO : button
            }
            label: {
                Image(systemName: "star")
                    .font(.title3)
                    .symbolVariant(.fill)
                    .foregroundColor(.yellow.opacity(0.3))
            }
            .buttonStyle(.plain)
        }    
    }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView()
    }
}
