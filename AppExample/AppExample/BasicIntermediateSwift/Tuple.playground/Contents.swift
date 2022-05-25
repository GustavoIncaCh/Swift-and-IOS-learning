import UIKit

var greeting = "tuple"

var person = ("Gustavo", "Inca", 23, 1.65)

print(person.1)
print(person.2)
print(person.0)
print(person.3)

// named tuple

var personNamedTuple = (name: "Gustavo",surname: "Inca",age:23,heigh: 1.65)

print(personNamedTuple)
personNamedTuple.age=40
print(personNamedTuple)
