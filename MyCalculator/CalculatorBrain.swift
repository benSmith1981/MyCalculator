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
    
    private var accumulator: Double = 0
    private var history: String = ""
    private var historySecond: String = ""
    private var lastOperation: String = ""

    func add(num: Double) -> Double{
        accumulator += num
        return accumulator
    }
    
    func multiply(num: Double) -> Double{
        accumulator = accumulator * num
        return accumulator
    }
    
    func minus(num: Double) -> Double{
        accumulator = accumulator - num
        return accumulator
    }
    func divide(num: Double) -> Double{
        accumulator =  accumulator / num
        return accumulator
    }
    
//    func doOperation(operation: String) -> String {
//        var screenText  = "" //initilais screen text
//        history = "" // clear history
//        if operation == "="{
//            screenText = doFunction(operation: lastOperation) //want to display result on screen
//        } else {
//            lastOperation = operation
//        }
//        return screenText
//    }
    
//    func doFunction(operation: String) -> String {
    func doOperation(operation: String) -> String {
        var screenText  = ""
        history = "" // clear history
        switch operation {
        case operations.plus.rawValue:
            screenText = String(add(num:accumulator))
        case operations.minus.rawValue:
            screenText = String(minus(num: accumulator))
        case operations.divide.rawValue:
            screenText = String(divide(num: accumulator))
            break
        case operations.multiply.rawValue:
            screenText = String(multiply(num: accumulator))
            break
        default:
            break
        }
        return screenText
    }
    
    func appendHistory(value: String) {
        history.append(value)
    }
    
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
