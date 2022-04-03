//: [Previous](@previous)

import Foundation

indirect enum AriphmeticExpressions {
    case number (Float) // num
    case plus (AriphmeticExpressions, AriphmeticExpressions) // сложение
    case minus (AriphmeticExpressions, AriphmeticExpressions) // вычитание
    case zvedochka (AriphmeticExpressions, AriphmeticExpressions) // умножение
    case slesh (AriphmeticExpressions, AriphmeticExpressions) // деление
}
    
func computation (myargument: AriphmeticExpressions) -> Float{
        switch myargument{
        case let .number(value):
            return value
        case let .plus(numberOne, numberTwo):
            return computation(myargument: numberOne) + computation(myargument: numberTwo)
        case let .minus(numberOne, numberTwo):
            return computation(myargument: numberOne) - computation(myargument: numberTwo)
        case let .zvedochka(numberOne, numberTwo):
            return computation(myargument: numberOne) * computation(myargument: numberTwo)
        case let .slesh(numberOne, numberTwo):
            return computation(myargument: numberOne) / computation(myargument: numberTwo)
        }
    }
    



// (2 * (8 / (15 - 9) + 4)
    
let fifteen = AriphmeticExpressions.number(15)
let nine = AriphmeticExpressions.number(9)
let firstPart = AriphmeticExpressions.minus(fifteen, nine)
let secondPart = AriphmeticExpressions.slesh(AriphmeticExpressions.number(8), firstPart)
let thirdPart = AriphmeticExpressions.plus(secondPart, AriphmeticExpressions.number(4))
let itog = AriphmeticExpressions.zvedochka( AriphmeticExpressions.number(2), thirdPart)

                                           
print(computation(myargument: itog))
