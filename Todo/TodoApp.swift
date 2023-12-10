//
//  TodoApp.swift
//  Todo
//
//  Created by user on 2023/12/08.
//

import SwiftUI

@main
struct firstTryApp: App {
  let persistenceController = PersistenceController()
    var body: some Scene {
        WindowGroup {
//            ContentView()
            HomeView()
//            Categoryimage()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
