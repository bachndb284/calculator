//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyen Bach on 12/23/16.
//  Copyright © 2016 Nguyen Bach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultDisplay: UILabel!
 
    var result = Float()
    var currentNumber = Float()
    var curruntRe = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curruntRe = "="
        resultDisplay.text = ("\(result)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonNumberInput(_ sender: UIButton) {
       
        currentNumber = currentNumber * 10 + Float(Int(sender.titleLabel!.text!)!)
        resultDisplay.text = ("\(currentNumber)")
    }
    @IBAction func buttonOperation(_ sender: UIButton) {
        switch curruntRe {
        case "=":
            result = currentNumber
        case "+":
            result = result + currentNumber
        case "-":
            result = result - currentNumber
        case "X":
            result = result * currentNumber
        case "/":
            result = result / currentNumber
        case "%":
            result = result / 100
        case "a^b":
            result = powf(result, currentNumber)
        case "+1":
            result = result + 1

        default:
            print("error")
        }
        currentNumber = 0
        resultDisplay.text = ("\(result)")
        if (sender.titleLabel!.text == "="){
            result = 0
        }
        curruntRe = sender.titleLabel!.text! as String
    }
    @IBAction func buttonClear(_ sender: UIButton) {
        result = 0
        currentNumber = 0
        curruntRe = "="
        resultDisplay.text = ("\(result)")
    }
    @IBAction func plus_minus(_ sender: UIButton) {
        currentNumber = 0 - currentNumber
        resultDisplay.text = ("\(currentNumber)")
    }
    @IBAction func randomNumber(_ sender: UIButton) {
        let rand1to1000 = Float.random(lower: 0, upper: 1000)
        currentNumber = rand1to1000
        resultDisplay.text = ("\(currentNumber)")
    }
  
}

extension Float{
    public static func random(lower: Float = 0, upper: Float = 1000) -> Float{
        return(Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}
