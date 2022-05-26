import UIKit

// typeCasting (validate the type of the data)

let myString:String = "Gustav"
let myInt:Int = 20

class MyClass {
    var name: String!
    var age: Int!
}

let myClass = MyClass()
myClass.name = "Gustavo"
myClass.age = 23

var myArray:[Any] = [myString,myInt,myClass]

// use of any for any type of data
// then we convert the value as the type we need
// with the word (as!)
// btw we use 'is' to ask for the type of data
for value in myArray{
    if value is String{
        print("the value \(value as! String) is a String")
    } else if value is Int{
        print("the value \(value as! Int) is a Int")
    } else if value is MyClass{
        let valueHelper = value as! MyClass
        print("the value \(valueHelper.name!) has an age of \(valueHelper.age!) too, and it is a Class")
    }
}
