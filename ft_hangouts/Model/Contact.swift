//
//  Contact.swift
//  ft_hangouts
//
//  Created by Julien Richard on 07/07/2023.
//

import Foundation
import CoreData

final class Contact: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var number: String
    @NSManaged var surname: String
    
//    override func awakeFromInsert() {
//        super.awakeFromInsert()
//        primitiveValue(forKey: <#T##String#>)
//    }
}
