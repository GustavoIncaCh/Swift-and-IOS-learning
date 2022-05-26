import UIKit
import Foundation

var myArray:[Int] = [4,5,1,9,3,10,2,6,8,7]

var myDictionary:Dictionary = [4:"four",
                               5:"five",
                               1:"one",
                               9:"nine",
                               3:"three",
                               10:"ten",
                               2:"two",
                               6:"six",
                               8:"eight",
                               7:"seven"]
var mySet: Set = [4,5,1,9,3,10,2,6,8,7]

let myMapArray = myArray.map{
    (myInt)->Int in return myInt * 2
}
print(myMapArray)

let myStringMapArray = myArray.map({
    (myString)->String in return "this is an string of \(myString)"
})
print(myStringMapArray)

let myDictionaryMap = myDictionary.map({
    (value)->Int in return value.key
})
print(myDictionaryMap)

let mySetMap = mySet.map({
    (value)->String in return "this is the set value \(value)"
})
print(mySetMap)
