//
//  CashTextFieldDelegate.swift
//  TextFields
//
//  Created by thanassis on 12/6/15.
//  Copyright (c) 2015 Athanasios Sarakatsianou. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    var currentString = ""
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            currentString += string
            textField.text = formatCurrency(currentString)
        default:
            var array = Array(string)
            var currentStringArray = Array(currentString)
            if array.count == 0 && currentStringArray.count != 0 {
                currentStringArray.removeLast()
                currentString = ""
                for character in currentStringArray {
                    currentString += String(character)
                }
                textField.text = formatCurrency(currentString)
            }
        }
        
        return false
    }

    func formatCurrency(string: String) -> String{
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "el_Gr")
        var numberFromField = (NSString(string: currentString).doubleValue)/100
        return formatter.stringFromNumber(numberFromField)!
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        currentString = ""
        textField.text = formatCurrency(currentString)
        return true
    }
    
    
    
}
