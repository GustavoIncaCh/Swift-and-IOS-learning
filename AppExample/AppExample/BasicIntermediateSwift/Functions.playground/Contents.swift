import UIKit

var greeting = "Hello, playground"

func newFunction(){
    print("aea KEKW")
}

for _ in 0...5{
    newFunction()
}

func printsquareNumber(numberValue:Int){
    print("everything is inside the func")
    print(String(numberValue*numberValue))
}
printsquareNumber(numberValue: 9)

func squareOfNumber(numberValue:Int) -> Int{
    return (numberValue*numberValue);
}
print(String(squareOfNumber(numberValue: 8)))

func greetings(name:String, message:String) -> String{
    return "hello "+name+" i'd like to tell u that "+message
}
print(greetings(name: "Nani", message: "u're such a good boy"))

func programedGreetins(name:String, message:String=" we like your work")->String{
    return "hey "+name+message
}
print(programedGreetins(name: "Gustavo"))
print(programedGreetins(name: "Gustavo",message: " this one is a personal message"))

// func with a multiple return values
func nameList() -> [String]{
    let names=["Dani","Maria","Elena"]
    return names
}

var namesVar = nameList()

// func with external params
func average3 (mats course1:Double, chemestry course2:Double, phisics course3:Double)->Double{
    return (course1+course2+course3)/3
}

average3(mats: 16, chemestry: 17.3, phisics: 9.5)
average3(mats: 10, chemestry: 13.8, phisics: 14.5)
average3(mats: 12.5, chemestry: 16, phisics: 12)

// Clousures
var firstClouse = {(mat1:Double,mat2:Double,mat3:Double)->Double in return (mat1+mat2+mat3)/3}

print("this is my first clousure \(firstClouse(90, 55, 133)), it's easier than i though")
