//
//  DataController.swift
//  Soarah
//
//  Created by khalid alhazmi on 09/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation
import CoreData


class DataController {
    static let shared = DataController()
    let persistentContainer = NSPersistentContainer(name: "Soarah")
    
    var viewContex: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    func load() {
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
        }
    }
}
