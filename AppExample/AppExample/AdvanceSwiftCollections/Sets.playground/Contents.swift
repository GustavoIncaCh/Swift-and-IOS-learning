import UIKit

var mySet = Set<String>()
var mySet2: Set<String> = ["Gustavo","Inca","23","Gustavo"]

mySet.insert("aea")
mySet.insert("KEKW")
mySet.insert("PEPELAUGH")
mySet.insert("LUL")
print(mySet)

// Access
if mySet.contains("PEPELAUGH"){
    print("its there")
} else{
    print("F")
}

// remove
mySet.remove("aea")
print(mySet)

// operation by index
if let setIndex = mySet.firstIndex(of: "LUL"){
    print(setIndex.self)
    mySet.remove(at: setIndex)
}
print(mySet)

// iterations
mySet.insert("KEKISTAN")
mySet.insert("Pog")
mySet.insert("Poggers")

for value in mySet {
    print(value)
}
// is the same as above
mySet.forEach{value in print(value)}

// operations with sets
let intSet: Set = [1,2,3,4,5,6,7]
let intSet2: Set = [5,6,7,8,9,10,11,12,13,14]

// intersection
print(intSet.intersection(intSet2))
// symetricDifference
print(intSet.symmetricDifference(intSet2))
// union
print(intSet.union(intSet2))
// subtracting
print(intSet.subtracting(intSet2))
print(intSet2.subtracting(intSet))
