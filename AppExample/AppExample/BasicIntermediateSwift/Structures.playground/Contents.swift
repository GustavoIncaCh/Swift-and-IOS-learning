import UIKit

struct squares{
    var height = 10
    var width = 10
    func area()->Double{
        return Double(height)*Double(width)
    }
}

var mySquare = squares()
print(String(mySquare.area()))

// define class

class car{
    var color = "black"
    var tire = 4
    var price = 30000
    
    func turnOn () -> Bool{
        return true
    }
    func turnOff () -> Bool{
        return false
    }
    func speedUp () -> Bool{
        return true
    }
    func slowDown () -> Bool{
        return false
    }
}

var newCar = car()

print(String(newCar.price))
