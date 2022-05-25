import UIKit

var changeNumber: Int = 56

changeNumber+=7
changeNumber-=35
changeNumber*=3
changeNumber/=3

var isBool: Bool = true

if (changeNumber<=40&&(!isBool)){
    print("first if")
} else if(isBool){print("at least someting")}
else{
    print("else KEKW")
}

// switch case, use this instead of a lot of ifs cases

var country:String = "america"

switch country {
case "PE":
    print("the language is spanish")
    break
case "AR":
    print("the language is spanish")
    break
case "ES":
    print("the language is spanish")
    break
case "EEUU", "USA", "eeuu", "AMERICA", "america":
    print("the language is english")
    break
case "BR", "br":
    print("the language is portuguese")
    break
default:
    print("undefined country")
}

var age = 6

switch age{
case 0,1,2:
    print("you're a baby")
case 3..<11:
    print("you're a kid")
case 11...16:
    print("you're at that age KEKW")
case 17..<30:
    print("you're good")
case 30...65:
    print("oohhh boii")
case 66..<100:
    print("you're an old guy")
default:
    print("😱😖")
}

// switxh with Emun

enum WalletData:String {
    case name
    case token
    case bank
    case interbank
    case account
}

var userData: WalletData = .name

switch userData{
    
case .name:
    print("NameData")
case .token:
    print("tokenData")
case .bank:
    print("bank data")
case .interbank:
    print("interbank data")
case .account:
    print("account data")
}
