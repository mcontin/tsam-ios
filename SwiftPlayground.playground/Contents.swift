//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Shape {
    var numberOfSides = 0;
    var name: String;
    
    init(sides: Int, name: String) {
        numberOfSides = sides;
        self.name = name;
    }
    
    deinit {
        numberOfSides = 0;
    }
    
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

var someShape = Shape(sides: 3, name: "triangolo");
print(someShape.numberOfSides);
someShape.simpleDescription();
var somePerimeter = someShape.getPerimeter(sides: [1,2,3,4]);

class Square: Shape {
    var sideLength: Double = 0;
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(sides: 4, name: name);
    }
    
    func getArea() -> Double {
        return sideLength * sideLength;
    }
    
    override func simpleDescription() -> String {
        return "lato del quadrato \(sideLength)";
    }
}


class TriangleEqui: Shape {
    var sideLength: Double = 0;
    
    var perimeter: Double {
        get {
            return sideLength * 3;
        }
        set {
            sideLength = newValue / 3;
        }
    }
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(sides: 3, name: name);
        numberOfSides = 3;
    }
    
    override func simpleDescription() -> String {
        return "lato del triangolo \(sideLength)";
    }
}

class TriangleAndSquare {
    var triangle: TriangleEqui {
        willSet {
            square.sideLength = newValue.sideLength;
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength;
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: "square");
        triangle = TriangleEqui(sideLength: size, name: "triangle");
    }
}

var test = TriangleAndSquare(size: 10, name: "asd");
print(test.square.sideLength);
print(test.triangle.sideLength);
test.square.sideLength = 333;
print(test.square.sideLength);
print(test.triangle.sideLength);

enum Rank: Int {
    case primo, secondo, terzo, quarto, quinto
    
    func description() -> String {
        switch self {
        case .primo:
            return "primo numero";
        default:
            return String(self.rawValue);
        }
    }
}

let placement = Rank.terzo.rawValue + 1;
print(placement);

enum ServerResponse {
    case result(String, String);
    case failure(String);
}

let success = ServerResponse.result("6 am", "8 pm");
let failure = ServerResponse.failure("rotto");

switch success {
case let .result(alba, tramonto):
    print("alba alle \(alba), tramonto alle \(tramonto)");
case let .failure(messaggio):
    print("\(messaggio)");
default:
    print("nah");
}

enum Suit {
    case picche, cuori, quadri, fiori
}

struct Card {
    var rank: Rank;
    var suit: Suit;
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank;
        self.suit = suit;
    }
    
    func simpleDescription() -> String {
        return "\(rank) di \(suit)";
    }
}

let dueDiPicche = Card(rank: Rank.secondo, suit: Suit.cuori);
dueDiPicche.simpleDescription();


extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
let x = Double(123 * 10).rounded() / 10
print(x)




class SmallMeal {
    var localId: String
    var uuid: String
    var fullDate: String
    var userId: String
    
    
    init(localId: String, uuid: String, fullDate: String, userId: String) {
        self.localId = localId
        self.uuid = uuid
        self.fullDate = fullDate
        self.userId = userId
    }
    
    
}





