import Cocoa

// concatenation
let myString = "estoy "+"como lokita"

// interpolation
let newString = "yo aun \(myString) y \nno dejare de estar \n como lokita :v"

// comparation
myString == newString

// is inside
newString.contains(myString)

// is empty
newString.isEmpty

let emptyString = ""
emptyString.isEmpty

// for each character
for i in newString {
    print(i)
}
print("-------------------------")
newString.forEach{eachWord in print(eachWord)}
