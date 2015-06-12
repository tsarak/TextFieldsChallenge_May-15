//
//  ViewController.swift
//  TextFields
//
//  Created by thanassis on 12/6/15.
//  Copyright (c) 2015 Athanasios Sarakatsianou. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var lockTextFieldSwitch: UISwitch!
    
    // Text Field Delegate objects
    let cashDelegate=CashTextFieldDelegate()
    let zipCodeDelegate = ZipCodeFieldTextDelegate()
    
    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lockSwitch(UISwitch())
        
        // Set the three delegates
        self.textField2.delegate = cashDelegate
        self.textField1.delegate = zipCodeDelegate
        self.textField3.delegate = self
    }

    
    // Text Field Delegate Methods
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
     let lockSwitchState = lockTextFieldSwitch.on
        if lockSwitchState {
        return true
        }else{
            return false
        }
    }
    
    @IBAction func lockSwitch(sender: UISwitch) {
        if lockTextFieldSwitch.on {
            textField3.enabled = true
            if textField3.text == "" {
                textField3.placeholder = "Text Field is Unlocked"
            }
        }else{
            textField3.enabled=false
            if textField3.text == "" {
                textField3.placeholder = "Text Field is Locked"
            
            }
        }
    }
    
}

