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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorBrain = CalculatorBrain()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func numberButton(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
            calculatorBrain.appendHistory(value: number)
            screen.text = calculatorBrain.getNumberString()
        }
    }
    
    @IBAction func operationButton(_ sender: UIButton) {
        if let operation = sender.titleLabel?.text {
//            calculatorBrain.appendHistory(value: operation)
            screen.text = calculatorBrain.doOperation(operation: operation)
        }
    }

}

