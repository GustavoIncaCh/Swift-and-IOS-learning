import UIKit

var greeting = "Emun"

// user must input personal data

enum UserData{
    case name
    case surname
    case address
    case phone
    case age
}

var getData: UserData = .name
var input:String = "Gustav"

print(getData)

enum UserDataDef{
    case name(String)
    case surname(String,String)
    case address(String,Int)
    case phone(Int)
    case age(Int)
}

var dataFromEnum: UserDataDef = .name("aea")
dataFromEnum = .address("casa aea", 14)
print(UserDataDef.self)

enum UserDataSame: String{
    case name = "Gustav"
    case surname = "Inca"
    case address = "Junin Street"
    case phone = "99999999"
    case age = "24"
}

UserDataSame.name.rawValue
UserDataSame.name.hashValue
UserDataSame.name.self

print("------------------------------")
print("ARRAY")

var arrayTry1:[Int] = [1,2,3,4,5,6,7,8,9]

// two-sided range operator
var subArray1:Array<Int>.SubSequence = arrayTry1[3...6]
var subArray2 = arrayTry1[3...6]

// one-sided range operator
var subArray3 = arrayTry1[...6]
var subArray4 = arrayTry1[4...]
var subArray5 = arrayTry1[1..<7]

// closed range
var arrayClosed = 3...16
// lets convert the closed range to an array
Array(arrayClosed)[5]
