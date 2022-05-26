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

// sort operations
print(myArray)
myArray.sort()
print(myArray)
myArray.sort{
    (intA,intB)->Bool in return intB < intA
}
print(myArray)

// sorted: this func creates a new array
// this new array can be saved and it is sorted

let myArraySorted: [Int] = myArray.sorted()
print(myArray)
print(myArraySorted)

let myDictionarySorted = myDictionary.sorted{
    (elementA, elementB)->Bool in return elementA.key > elementB.key
}
print(myDictionary)
print(myDictionarySorted)

let mySetSorted = mySet.sorted{
    (elementA, elementB)->Bool in return elementA > elementB
}
print(mySet)
print(mySetSorted)

