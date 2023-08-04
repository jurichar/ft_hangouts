//
//  AppView.swift
//  hangouts
//
//  Created by Julien Richard on 18/07/2023.
//

import SwiftUI

struct AppView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            MessageListView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Messages")
            }
            ContactListView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Contacts")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
