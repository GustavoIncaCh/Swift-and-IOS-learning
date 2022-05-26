import UIKit

// Protocols
// it force to use the protocol to those who extends it

protocol PersonProtocol {
    // set : is use to give a value
    // get : to get the value
    var name: String {get set}
    var age: String {get set}
}

struct Programer: PersonProtocol{
    var name: String
    var age: String
    var language:String
}

struct Teacher: PersonProtocol{
    var name: String
    var age: String
    var subject: String
}

struct Cientist{
    var mat: String
}

// delegate protocol

class FirstClass: DelegateProtocol {
    func call() {
        print("Ingrese al delegateProtocol y me invoque en la primera clase")
    }
    
    func callSecond(){
        let secondClass = SecondClass()
        secondClass.delegate = self
        secondClass.callFirst()
    }
}

class SecondClass {
    var delegate: DelegateProtocol?
    func callFirst(){
        sleep(3)
        delegate?.call()
    }
}

protocol DelegateProtocol{
    func call()
}

let firstClass = FirstClass()
firstClass.callSecond()
