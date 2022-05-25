import UIKit

func sum(firstNumber: Int?, secondNumber: Int?) throws -> Int{
    if (firstNumber==nil){
        throw SumError.firstNumberNil
    } else if (secondNumber==nil){
        throw SumError.secondNumberNil
    } else if (firstNumber!<0 || secondNumber!<0){
        throw SumError.negativeNumbers(firstNumber: firstNumber!, secondNumber: secondNumber!)
    }
    return firstNumber!+secondNumber!
}

// use the enum to enumerate the errors
// and give a good ans to every error
// we can get

// error definition
enum SumError: Error{
    case firstNumberNil
    case secondNumberNil
    case negativeNumbers(firstNumber: Int, secondNumber: Int)
}

// error propagation

do {
    print(try sum(firstNumber: nil, secondNumber: 20))
} catch SumError.firstNumberNil{
    print("the first value is nil")
} catch SumError.secondNumberNil{
    print("the second value is nil")
} catch SumError.negativeNumbers(firstNumber: _, secondNumber: _){
    print("some of the values are negative")
}
