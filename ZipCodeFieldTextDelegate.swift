//
//  ZipCodeFieldTextDelegate.swift
//  TextFields
//
//  Created by thanassis on 12/6/15.
//  Copyright (c) 2015 Athanasios Sarakatsianou. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeFieldTextDelegate: NSObject, UITextFieldDelegate {
    var currentString: String = ""
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            let length = count(currentString)
            if length+1 < 6{
                currentString += string
                textField.text = currentString
            }
        default:
            if count(textField.text) > 0 {
                currentString = textField.text
            }
            var array = Array(string)
            var currentStringArray = Array(currentString)
            if array.count == 0 && currentStringArray.count != 0 {
                currentStringArray.removeLast()
                currentString = ""
                for character in currentStringArray {
                    currentString += String(character)
                }
                textField.text = currentString
            }
        }
        return false
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        currentString = ""
        textField.text = currentString
        return true
    }
    
}
