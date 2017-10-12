//
//  ViewController.swift
//  MyCalculator
//
//  Created by ben on 12/10/2017.
//  Copyright © 2017 ben. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var screen: UITextField!
    var calculatorBrain: CalculatorBrain!
    var userIsInTheMiddleOfTyping: Bool = false
    private var displayValue: Double {
        get {
            return Double(screen.text!)!
        }
        
        set {
            screen.text = String(newValue)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        CalculatorBrain.price
        calculatorBrain = CalculatorBrain()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func numberButton(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            
            if userIsInTheMiddleOfTyping {
                screen.text = screen.text! + digit
                calculatorBrain.numOnScreen = Double(screen.text!)!
            } else {
                screen.text = digit
                calculatorBrain.numOnScreen = Double(screen.text!)!

            }
            userIsInTheMiddleOfTyping = true
        
        }
    }
    
    @IBAction func operationButton(_ sender: UIButton) {
        if let operation = sender.titleLabel?.text {
            

            if (userIsInTheMiddleOfTyping) {
                //then we update the numebr array
                if let text = screen.text , let num = Double(text) {
                    calculatorBrain.historyArray.append(num)
//                    calculatorBrain.previousNumber = num

                }
                userIsInTheMiddleOfTyping = false
            }
            
            if operation != "=" && operation != "ac" {
                calculatorBrain.lastOperation = operation
            }
            screen.text = calculatorBrain.doFunction(operation: operation)
            
        }
    }

}

