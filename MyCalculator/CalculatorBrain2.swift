
//
//  CalculatorBrain2.swift
//  Calculator
//
//  Created by ben on 13/10/2017.
//  Copyright © 2017 Kyle Bolton. All rights reserved.
//

import Foundation
import UIKit

class CalculatorBrain2 {
    
    func calculate(expression: String) -> Double {
        let expression = NSExpression(format:expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            return result
        } else {
            print("error evaluating expression")
        }
        return 0

    }
    
    func convertStringTo(_ exp: String) -> String{
        let expression = NSExpression(format: exp)
        return String(describing: expression)
    }
}
