import UIKit

// Extensions

let meters: Double = 100000.0

func metersToKm(meters:Double)->Double{
    return meters/1000
}

// this extencion works for all the double var
// so u can use it to define new properties
extension Double{
    var km: Double {
        return self / 1000
    }
    var m: Double{
        return self
    }
    var cm: Double{
        return self * 100
    }
}

print(meters.km)

