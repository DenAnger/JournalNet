//
//  JournalNetApp.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI
import SwiftData

@main
struct JournalNetApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Article.self,
			Event.self,
			Budget.self,
			Post.self
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
            TabViewController()
        }
        .modelContainer(sharedModelContainer)
    }
}
