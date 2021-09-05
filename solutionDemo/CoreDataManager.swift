//
//  CoreDataManager.swift
//  solutionDemo
//

import Foundation
import UIKit
import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    var shortcutArray: [Shortcut] = []
    
    let persistentContainer: NSPersistentContainer = {
        let perCon = NSPersistentContainer(name: "Model")
        perCon.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                //fatalError("\(err)")
            }
        }
        return perCon
    }()
    
    func fetchShortcuts() -> [Shortcut] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Shortcut>(entityName: "Shortcut")
        do {
            let shortcuts = try context.fetch(fetchRequest)
            return shortcuts
        } catch let err {
            print("\(err)")
            return []
        }
    }
    
    func resetShortcuts() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //persistentContainer.viewContext
        let batchRequest = NSBatchDeleteRequest(fetchRequest: Shortcut.fetchRequest())
        do {
            try context.execute(batchRequest)
        } catch let err {
            print("\(err)")
        }
    }
    
    
}


