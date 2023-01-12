//
//  ScrollableHeaderApp.swift
//  ScrollableHeader
//
//  Created by Abdullah Karaboğa on 12.01.2023.
//

import SwiftUI

@main
struct ScrollableHeaderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
