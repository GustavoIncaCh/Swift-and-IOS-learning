import UIKit

var array1 = [2,3,4]
let array2 = [9,8,7]

// some operations

print(array1)
print(array2)
	
array1.append(9)
print(array1)

array1.append(contentsOf: array2)

array1.removeLast()
print(array1)

array1.removeFirst()
print(array1)

var cleanArray:[Int] = []
print(cleanArray)

var charArray:[String] = []
charArray.append("este")
charArray.append("es")
charArray.append("un")
charArray.append("array")
print(charArray.joined(separator: " "))
