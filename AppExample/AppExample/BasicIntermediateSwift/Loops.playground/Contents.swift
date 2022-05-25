import UIKit

var greeting = "Loops"

for dat in 0...10{
    print(dat)
}

var countries:[String] = ["PERU", "BRAZIL","GERMANY","ITALLY","CHINA"]

for country in countries {
    print(country)
}

var betterCountries:[String:String] = ["PERU":"FOOD", "BRAZIL":"FOOTBALL","GERMANY":"TECHNOLOGY","ITALLY":"PIZZA","CHINA":"RED"]

for (country,description) in betterCountries{
    print("\(country.lowercased() + "KEKW") and its \(description) ")
}

// while loop

var degree = "bachellor"
var years = 1

while (degree == "bachellor"){
    years+=1
    if (years>5){
        degree = "Magister"
    }
    print(degree+" in "+String(years)+"years")
}
