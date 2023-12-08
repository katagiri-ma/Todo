//
//  Persistent.swift
//  Todo
//
//  Created by user on 2023/12/08.
//

import CoreData

struct PersistenceController {
  let container: NSPersistentContainer

  init() {
    container = NSPersistentContainer(name: "MyCoreData")

    container.loadPersistentStores(completionHandler: {(storeDescripion, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error)")
      }
    })
  }
}
