import UIKit

struct ChessPiece{
    let color:Color
    let piece:ChessPiece
    
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
    var description:String{
        return "there are \(piece.number.number) pieces, its \(color.rawValue) and it's a \(piece.rawValue)"
    }
}

let myPiece = ChessPiece(color: .black, piece: .queen)
print(myPiece.description)

struct ChessPieceDescription{
    let color:Color
    let piece:ChessPiece
    
    enum Color: String{
        case white = "blanco"
        case black = "negro"
    }
    // look how it anidate a struc inside an enum
    enum ChessPiece:String {
        case king   = "rey"
        case queen  = "reina"
        case rock   = "torre"
        case bishop = "alfil"
        case knight = "caballo"
        case pawn   = "peon"
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
    var description:String{
        return "there are \(piece.number.number) pieces, its \(color.rawValue) and it's a \(piece.rawValue)"
    }
}

let myPiece2 = ChessPieceDescription(color: .black, piece: .queen)
print(myPiece2.description)
