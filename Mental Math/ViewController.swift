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
    var time = 10
    var SwiftTimer = NSTimer()
    var counter = 1
    var playPauseEnabled = true
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var operationSymbolLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var cover: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        userAnswerTextField.delegate = self
        
        checkmarkImageView.hidden = true
        operation = "Addition"
        operationSymbolLabel.text = "+"
        operationLabel.text = operation
        scoreLabel.text = "Score: " + String(score)
        cover.hidden = false
        correctAnswerLabel.hidden = true
        numberGenerator()
        SwiftTimer.invalidate()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        SwiftTimer.invalidate()
        
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
        answerChecker()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        userAnswer = Int(userAnswerTextField.text!)!
    }
    
    
    // MARK: Actions
    
    @IBAction func add(sender: UIBarButtonItem) {
        cover.hidden = true
        operation = "Addition"
        self.operationLabel.text = operation
        operationSymbolLabel.text = "+"
        numberGenerator()
    }
    
    @IBAction func subtract(sender: UIBarButtonItem) {
        cover.hidden = true
        operation = "Subtraction"
        self.operationLabel.text = operation
        operationSymbolLabel.text = "-"
        numberGenerator()
    }
    
    @IBAction func multiply(sender: UIBarButtonItem) {
        cover.hidden = true
        operation = "Multiplication"
        self.operationLabel.text = operation
        operationSymbolLabel.text = "x"
        numberGenerator()
    }
    
    @IBAction func divide(sender: UIBarButtonItem) {
        cover.hidden = true
        operation = "Division"
        self.operationLabel.text = operation
        operationSymbolLabel.text = "÷"
        numberGenerator()
    }
  
    @IBAction func newNumbers(sender: UIButton) {
        numberGenerator()
    }
    
    func numberGenerator() {
        print("MARK")
        SwiftTimer.invalidate()
        playPauseEnabled = true
        firstNumberLabel.text = ""
        secondNumberLabel.text = ""
        userAnswerTextField.text = ""
        correctAnswerLabel.hidden = true
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
        
       checkmarkImageView.hidden = true
        time = 10
        counter = 1
        timer(time)
    }
    
    
    @IBAction func start(sender: UIBarButtonItem) {
        if (playPauseEnabled){
            cover.hidden = true
            timer(time)
        }
    }
    
    @IBAction func Pause(sender: UIBarButtonItem) {
        if (playPauseEnabled) {
            SwiftTimer.invalidate()
            cover.hidden = false
        }
    }

    
    func timer(time: Int) {
        SwiftTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(updateTimer), userInfo: time, repeats: true)
    }
    
    func updateTimer(SwiftTimer:NSTimer) {
       print("counter", counter)
        if (counter == 1) {
            time = SwiftTimer.userInfo as! Int
        }
        
        timerLabel.text = "Time: \(time)"
        
        print(time)

        if (time <= 0) {
            SwiftTimer.invalidate()
            answerChecker()
        }
        
        counter += 1

        time -= 1
    }
    
    func answerChecker() {
        playPauseEnabled = false
        correctAnswerLabel.hidden = false
        if userAnswer == answer {
            correctAnswerLabel.text = "The answer is \(answer). You are correct!"
            // makes check show
            checkmarkImageView.hidden = false
            checkmarkImageView.image = UIImage(named: "Checkmark")
            score += 5
            scoreLabel.text = "Score: " + String(score)
        } else {
            if (time < 0) {
                correctAnswerLabel.text = "You ran out of time! The correct answer is \(answer)."
            } else {
                correctAnswerLabel.text = "The answer is \(answer). You are incorrect."
            }
            // makes x show
            
            checkmarkImageView.hidden = false
            checkmarkImageView.image = UIImage(named: "X")
            score += -5
            scoreLabel.text = "Score: " + String(score)
        }

    }
    
}


