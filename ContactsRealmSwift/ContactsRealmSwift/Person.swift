//
//  Person.swift
//  ContactsRealmSwift
//
//  Created by Mattia Contin  on 16/03/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    
    dynamic var id: String!
    var dogs = List<Dog>()
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    convenience init(id: String) {
        self.init()
        
        self.id = id
    }
    
}

class Dog: Object {
    
    dynamic var id: String!
    dynamic var name: String!
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    convenience init(id: String, name: String) {
        self.init()
        
        self.id = id
        self.name = name
    }
}
