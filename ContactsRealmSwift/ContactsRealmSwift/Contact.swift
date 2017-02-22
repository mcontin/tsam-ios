//
//  Contact.swift
//  RealmSwift
//
//  Created by Mattia Contin  on 22/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import Foundation


class Contact {
    
    var name: String;
    var surname: String;
    var age: Int;
    
    init() {
        self.name = "";
        self.surname = "";
        self.age = -1;
    }
    
    init(name: String, surname: String, age: Int) {
        self.name = name;
        self.surname = surname;
        self.age = age;
    }
    
    func simpleDescription() -> String {
        return "\(name) \(surname), \(age)";
    }

}
