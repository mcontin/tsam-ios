//
//  Contact.swift
//  RealmSwift
//
//  Created by Mattia Contin  on 22/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
    
    // dynamic serve perchè object è utilizzata in codice obj-c di realm
    dynamic var name = "";
    dynamic var surname = "";
    dynamic var age = -1;
    
    convenience init(withName name: String, surname: String, andAge age: Int) {
        self.init();
        self.name = name;
        self.surname = surname;
        self.age = age;
    }
 
    func simpleDescription() -> String {
        return "\(name) \(surname), \(age)";
     }

}
