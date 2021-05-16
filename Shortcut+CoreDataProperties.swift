//
//  Shortcut+CoreDataProperties.swift
//  solutionDemo
//
//  Created by Patrick Lee on 4/24/21.
//
//

import Foundation
import CoreData


extension Shortcut {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shortcut> {
        return NSFetchRequest<Shortcut>(entityName: "Shortcut")
    }

    @NSManaged public var option: [String]?
    @NSManaged public var title: String?

}

extension Shortcut : Identifiable {

}
