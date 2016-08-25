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
    
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var userAnswer: UITextField!
    @IBOutlet weak var correctAnswer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func add(sender: UIButton) {
        
    }
    @IBAction func multiply(sender: UIButton) {
    }
  
    @IBAction func subtract(sender: UIButton) {
    }
    @IBAction func divide(sender: UIButton) {
    }
   
    @IBAction func checkAnswer(sender: UIButton) {
    }
}

