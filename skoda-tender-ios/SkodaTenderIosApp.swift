//
//  SkodaTenderIosApp.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import SwiftData
import SwiftUI

@main
struct SkodaTenderIosApp: App {

    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ItemModel.self,
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
                .onAppear(perform: { appDelegate.app = self })
        }
            .modelContainer(sharedModelContainer)
    }
}
