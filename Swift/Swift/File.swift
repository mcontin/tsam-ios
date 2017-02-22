//
//  File.swift
//  Swift
//
//  Created by Mattia Contin  on 21/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import Foundation

class Shape {
    var numberOfSides = 0;
    let constant = "Hello world";
    
    func simpleDescription() -> String {
        return "Sides: \(numberOfSides)";
    }
    
    func getPerimeter(sides: [Int]) -> Int {
        var perimeter = 0;
        for side in sides {
            perimeter += side;
        }
        return perimeter;
    }
}

