//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Kazuki Omori on 2023/03/26.
//

import SwiftUI

@main
struct TodoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
