//
//  hangoutsApp.swift
//  hangouts
//
//  Created by Julien Richard on 14/07/2023.
//

import SwiftUI
import CoreData

@main
struct hangoutsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AppView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


