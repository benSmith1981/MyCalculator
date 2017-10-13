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

class CalculatorBrain {
    var accumulator: Double
    
    //history of the calculator so we can get previous and current screen items
    var historyArray: [Double] = []
    //last operator used so we do correct function if equals is pressed
    var lastOperation: String = ""

    //these are set so we can do the maths
    var numOnScreen: Double = 0
    var previousNumber:Double = 0

    init(acc: Double) {
        self.accumulator = acc
    }
    
    func add() -> Double{
        accumulator =  (previousNumber + numOnScreen)
        return accumulator
    }
    
    func multiply() -> Double{
        accumulator =  (previousNumber * numOnScreen)
        return accumulator
    }
    
    func minus() -> Double{
        accumulator = (previousNumber - numOnScreen)
        return accumulator
    }
    func divide() -> Double{

        accumulator = (previousNumber / numOnScreen)
        return accumulator
    }

    func doFunction(operation: String) -> String {
        var screenText  = "" //holds screen text
        
        //if there is a previous number entered should be 2 before end of arrat as we keep appending
        if historyArray.count - 2 >= 0 {
            //store previous number
            previousNumber = historyArray[historyArray.count-2]
        }
        //count-1 is the end of the array, the number just typed on screen
        numOnScreen = historyArray[historyArray.count-1]

        //switch on the operator + - * /
        switch operation {
        case operations.plus.rawValue:
            //if person previously pressed +  then add previous and last number
            if lastOperation == "+" {
                //set screen text to this result
                screenText = String(add())
                //make the result, or the accumulator the previous number now, so all other numbers are added to it
                historyArray.append(accumulator)
            } else {
                //else if last operation was not + just return symbol
                screenText = operations.plus.rawValue
            }
            //store last operator, so we know what operator to do
            lastOperation = "+"
        case operations.minus.rawValue:
            if lastOperation == "-" {
                screenText = String(minus())
                historyArray.append(accumulator)
            } else {
                screenText = operations.minus.rawValue
            }
            lastOperation = "-"

        case operations.divide.rawValue:
            if lastOperation == "/" {
                screenText = String(minus())
                historyArray.append(accumulator)
            } else {
                screenText = operations.divide.rawValue

            }
            lastOperation = "/"

            break
        case operations.multiply.rawValue:
            if lastOperation == "*" {
                screenText = String(minus())
                historyArray.append(accumulator)
            } else {
                screenText = operations.multiply.rawValue
            }
            lastOperation = "*"

            break
        case operations.equals.rawValue:
            //if it is equals then check the last operator and do correct function
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
            //make sure result is appenended tto our history, so we add all numbers to this
            historyArray.append(accumulator)
            break
        case operations.ac.rawValue:
            //clear the memory
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
    
//    func appendHistory(value: String) {
//        history.append(value)
//    }
    
//    func setOperand(operand: Double) {
//        accumulator = operand
//        historyArray.append(String(operand))
//        lastOperation = .Digit
//    }

//    func getNumberString() -> String{
//        return history
//    }
//
//    func getNumber() -> Double{
//        if let numberDouble = Double(history) {
//            return numberDouble
//        } else {
//            return 0
//        }
//    }
}
