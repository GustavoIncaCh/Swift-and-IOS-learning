import UIKit

let myStringNumber = "100"
let myIntNumber = Int(myStringNumber)

let myWrongStringNumber = "Gustav"
let myWrongIntNumber = Int(myWrongStringNumber)

var newStringNull: String?

if (newStringNull != nil){
    print("not null ma bro")
}else{
    print("nil ma bra")
}

newStringNull = "aea"
if (newStringNull != nil){
    print("not null ma bro")
}else{
    print("nil ma bra")
}

// here the nil functions also work with (!)
// like in flutter class.getvalue!.value
// the ! ask for nil values

// optinal chain
class Student{
    var name: String?
    var book: Book?
}

class Book {
    var pages: Int?
}

let myStudent = Student()

print(myStudent.name)
print(myStudent.book?.pages)

myStudent.name = "Gustav"
myStudent.book = Book()

if let pages = myStudent.book?.pages, let name = myStudent.name{
    print("the book of \(name) has \(pages) pages")
} else{
    print("this book has no pages")
}

myStudent.book?.pages = 50
if let pages = myStudent.book?.pages, let name = myStudent.name{
    print("the book of \(name) has \(pages) pages")
} else{
    print("this book has no pages")
}

// guard let
var optionalString : String?

func myFunction(){
    guard let myString = optionalString else {
        print("null value")
        return
    }
}
