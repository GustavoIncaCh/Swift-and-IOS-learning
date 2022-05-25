import UIKit

struct ChessPiece{
    enum Color: String{
        case white
        case black
    }
    // look how it anidate a struc inside an enum
    enum ChessPiece:String {
        case king
        case queen
        case rock
        case bishop
        case knight
        case pawn
        struct Number{
            let number:Int
        }
        var number:Number{
            switch self{
            case .king:
                return Number(number: 1)
            case .queen:
                return Number(number: 1)
            case .rock:
                return Number(number: 2)
            case .bishop:
                return Number(number: 2)
            case .knight:
                return Number(number: 2)
            case .pawn:
                return Number(number: 8)
            }
        }
    }
    
}
