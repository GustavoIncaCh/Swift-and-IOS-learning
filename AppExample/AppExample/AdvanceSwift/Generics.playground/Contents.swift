import UIKit

// generics

// inout : is a reserved word which is used to input and return
// a variable at the same time

func swapTwoInts(firstInt: inout Int, secondInt: inout Int){
    let tempA = firstInt
    firstInt = secondInt
    secondInt = tempA
}

var myInt1 = 123
var myInt2 = 909

print("first: \(myInt1), second: \(myInt2)")

swapTwoInts(firstInt: &myInt1, secondInt: &myInt2)

print("first: \(myInt1), second: \(myInt2)")

// so we can use the generic var to declase a func
// with "generic var" and it will work
// like with an ANY var

func swapTwoGeneric<T>(firstInt: inout T, secondInt: inout T){
    let tempA = firstInt
    firstInt = secondInt
    secondInt = tempA
}

var my1 = "999"
var my2 = "99.9"

print("first: \(my1), second: \(my2)")

swapTwoGeneric(firstInt: &my1, secondInt: &my2)

print("first: \(my1), second: \(my2)")
