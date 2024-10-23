//
//  TestSwiftDataApp.swift
//  TestSwiftData
//
//  Created by Francisco Aguirre San Román on 22/10/24.
//

import SwiftUI
import SwiftData

@main
struct TestSwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Works.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
