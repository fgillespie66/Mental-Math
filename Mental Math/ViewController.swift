//
//  ViewController.swift
//  Mental Math
//
//  Created by Fiona Gillespie on 8/24/16.
//  Copyright © 2016 Fiona Gillespie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    var firstNumberInt: Int = 0
    var secondNumberInt: Int = 0
    var operation: String = "default"
    var answer:Int = 0
    var userAnswer:Int = 2
    var score = 0
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!

    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var correctAnswerLabel: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var operationSymbolLabel: UILabel!
    
    @IBOutlet weak var checkmarkImageView: UIImageView!

    @IBOutlet weak var xImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        userAnswerTextField.delegate = self
        
        operation = "Addition"
        operationSymbolLabel.text = "+"
        operationLabel.text = operation
        numberGenerator()
        scoreLabel.text = "Score: " + String(score)
        
        // make check and x invisible
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        switch operation {
            case "Addition":
                answer = firstNumberInt + secondNumberInt
            case "Subtraction":
                answer = firstNumberInt - secondNumberInt
            case "Multiplication":
                answer = firstNumberInt * secondNumberInt
            case "Division": break
            default: break
        }
        
        if userAnswer == answer {
            correctAnswerLabel.text = "The answer is \(answer). You are correct!"
            //make check visible
            score += 5
            scoreLabel.text = "Score: " + String(score)
        } else {
            correctAnswerLabel.text = "The answer is \(answer). You are incorrect."
            //make x visible
            score += -5
            scoreLabel.text = "Score: " + String(score)
        }
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        userAnswer = Int(userAnswerTextField.text!)!
    }
    
    
    // MARK: Actions
    
    @IBAction func add(sender: UIBarButtonItem) {
        operation = "Addition"
        self.operationLabel.text = operation
        operationSymbolLabel.text = "+"
        numberGenerator()
    }
    
    @IBAction func subtract(sender: UIBarButtonItem) {
        operation = "Subtraction"
        self.operationLabel.text = operation
        operationSymbolLabel.text = "-"
        numberGenerator()
    }
    
    @IBAction func multiply(sender: UIBarButtonItem) {
        operation = "Multiplication"
        self.operationLabel.text = operation
        operationSymbolLabel.text = "x"
        numberGenerator()
    }
    
    @IBAction func divide(sender: UIBarButtonItem) {
        operation = "Division"
        self.operationLabel.text = operation
        operationSymbolLabel.text = "÷"
        numberGenerator()
    }
    
    
    @IBAction func newNumbers(sender: UIButton) {
        numberGenerator()
    }
    
    func numberGenerator() {
        firstNumberLabel.text = ""
        secondNumberLabel.text = ""
        userAnswerTextField.text = ""
        correctAnswerLabel.text = "Result"
       //operationLabel.text = "Operation"
        //operationSymbolLabel.text = "N/A"
        
        switch operation {
            case "Addition":
                firstNumberInt = Int(arc4random_uniform(99) + 1)
                secondNumberInt = Int(arc4random_uniform(99) + 1)
            case "Subtraction":
                firstNumberInt = Int(arc4random_uniform(99) + 1)
                secondNumberInt = Int(arc4random_uniform(UInt32(firstNumberInt)) + 1)
            case "Multiplication":
                firstNumberInt = Int(arc4random_uniform(11) + 1)
                secondNumberInt = Int(arc4random_uniform(11) + 1)
            case "Division":
                secondNumberInt = Int(arc4random_uniform(11) + 1)
                answer = Int(arc4random_uniform(11) + 1)
                firstNumberInt = secondNumberInt * answer

            default:
                firstNumberInt = 0
        }
        firstNumberLabel.text = String(firstNumberInt)
        secondNumberLabel.text = String(secondNumberInt)
        
        // make check and x invisible

    }
    
}


