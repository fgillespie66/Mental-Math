//
//  ViewController.swift
//  Mental Math
//
//  Created by Fiona Gillespie on 8/24/16.
//  Copyright © 2016 Fiona Gillespie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    var firstNumberInt: Int = 6
    var secondNumberInt: Int = 5
    var operation: String = "default"
    var answer:Int = 0
    var userAnswer:Int = 2
    

    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var correctAnswerLabel: UILabel!

    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var operationSymbolLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    
    @IBAction func add(sender: UIBarButtonItem) {
        operation = "Addition"
        operationSymbolLabel.text = "+"
    }
    
    
    @IBAction func subtract(sender: UIBarButtonItem) {
        operation = "Subtraction"
        operationSymbolLabel.text = "-"
    }
    
    @IBAction func multiply(sender: UIBarButtonItem) {
        operation = "Multiplication"
        operationSymbolLabel.text = "x"
    }
    
    @IBAction func divide(sender: UIBarButtonItem) {
        operation = "Division"
        operationSymbolLabel.text = "÷"
    }
    
    @IBAction func newNumbers(sender: UIButton) {
        switch operation {
            case "Addition":
                firstNumberInt = Int(arc4random_uniform(99) + 1)
                secondNumberInt = Int(arc4random_uniform(99) + 1)
                firstNumberTextField.text = String(firstNumberInt)
                secondNumberTextField.text = String(secondNumberInt)
            
            default:
                firstNumberInt = 0
        }
        self.operationLabel.text = operation
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        answer = firstNumberInt + secondNumberInt
        userAnswer = Int(userAnswerTextField.text!)!
        if userAnswer == answer {
            correctAnswerLabel.text = "The answer is \(answer). You are correct!"
        } else {
            correctAnswerLabel.text = "The answer is \(answer). You are incorrect."
        }
    }
   

}


