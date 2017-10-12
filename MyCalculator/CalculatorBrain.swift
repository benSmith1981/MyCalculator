//
//  CalculatorBrain.swift
//  MyCalculator
//
//  Created by ben on 12/10/2017.
//  Copyright © 2017 ben. All rights reserved.
//

import Foundation

enum operations: String {
    case plus = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "*"
    case equals = "="
    case ac = "AC"

}

private enum LastOperation {
    case Digit
    case BinaryOperation
    case Equals
    case Clear
}

class CalculatorBrain {
    var accumulator: Double = 0
    
    var historyArray: [Double] = []

    var history: String = ""
//    private var lastOperation: LastOperation = .Clear
    var lastOperation: String = ""

    var numOnScreen: Double = 0
    var previousNumber:Double = 0
    var result:Double = 0

    func add() -> Double{
//        accumulator = historyArray.reduce(0, { (acc, current) -> Double in
//            return acc + current
//        })
        accumulator =  (previousNumber + numOnScreen)
        return accumulator
    }
    
    func multiply() -> Double{
//        accumulator = historyArray.reduce(0, { (acc, current) -> Double in
//            return acc * current
//        })
        accumulator =  (previousNumber * numOnScreen)

        return accumulator
    }
    
    func minus() -> Double{
//        accumulator = historyArray.reduce(0, { (acc, current) -> Double in
//            return acc - current
//        })
        accumulator = (previousNumber - numOnScreen)
        return accumulator
    }
    func divide() -> Double{
//        accumulator = historyArray.reduce(0, { (acc, current) -> Double in
//            return acc / current
//        })
        accumulator = (previousNumber / numOnScreen)

        return accumulator
    }
    
    func doOperation(operation: String) -> String {
        var screenText  = "" //initilais screen text
        history = "" // clear history
        if operation == "=" || operation == "" || operation == "ac"{
        } else {
            previousNumber = self.getNumber()
        }
        return self.getNumberString()
    }
    
    func doFunction(operation: String) -> String {
        var screenText  = ""
        
        if historyArray.count - 2 >= 0 {
            previousNumber = historyArray[historyArray.count-2]
        }
        numOnScreen = historyArray[historyArray.count-1]

        switch operation {
        case operations.plus.rawValue:
            lastOperation = "+"
            screenText = operations.plus.rawValue
        case operations.minus.rawValue:
            screenText = operations.minus.rawValue
            lastOperation = "-"

        case operations.divide.rawValue:
            screenText = operations.divide.rawValue
            lastOperation = "/"

            break
        case operations.multiply.rawValue:
            screenText = operations.multiply.rawValue
            lastOperation = "*"

            break
        case operations.equals.rawValue:
            
            if lastOperation == "+" {
                screenText = String(add())
            } else if lastOperation == "-" {
                screenText = String(minus())
            }  else if lastOperation == "/" {
                screenText = String(divide())
            }  else if lastOperation == "*" {
                screenText = String(multiply())
            } else {
                screenText = ""
            }
            historyArray.append(accumulator)
            break
        case operations.ac.rawValue:
            screenText = ""
            historyArray = []
            previousNumber = 0
            numOnScreen = 0
            break
        default:
            break
        }
        
        return screenText
    }
    
    func appendHistory(value: String) {
        history.append(value)
    }
    
//    func setOperand(operand: Double) {
//        accumulator = operand
//        historyArray.append(String(operand))
//        lastOperation = .Digit
//    }

    func getNumberString() -> String{
        return history
    }

    func getNumber() -> Double{
        if let numberDouble = Double(history) {
            return numberDouble
        } else {
            return 0
        }
    }
}
