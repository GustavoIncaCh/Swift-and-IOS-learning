import UIKit

var greeting = "i dont like xcode"

// it seem to be like a Map
// the first value (Int) is like the key,
// and the second value is the storage value from the Int key
// this second value must be a (String)
var myDictionary = Dictionary<Int,String>()
var newDictionary = [Int:String]()

// add data
newDictionary = [001:"dni", 002:"asdad"]

newDictionary[003] = "otro valor"
newDictionary[004] = "cuatro"
newDictionary[005] = "cinco"

print(newDictionary)

// to update the dictionary, just acces
// to the key and give a new value
newDictionary[005] = "nuevo cinco"
print(newDictionary)

// delete an item
// we can asign a null value to delete the item
newDictionary[004] = nil
print(newDictionary)
// we can use removeValue too
newDictionary.removeValue(forKey: 003)
print(newDictionary)

// index
newDictionary.index(forKey: 001)

// iterate inside
newDictionary.forEach{print($0)}

