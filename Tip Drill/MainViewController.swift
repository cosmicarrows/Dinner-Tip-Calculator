//  Created for Tip Drill in 2018
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
// Using Swift 4.0
// Running on macOS 10.13
/*
 Submit an email to Cosmic Arrows, LLC <laurence@cosmicarrows.com>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

*/

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fifteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    @IBOutlet weak var priceOfMeal: UITextField!
    @IBOutlet weak var youPayCleverStatement: UILabel!
    @IBOutlet weak var amountToPayForMeal: UILabel!
    
    var priceOfMealValue: Float?
    let tenPercentTip = 0.10
    let fifteenPercentTip = 0.15
    let twentyPercentTip = 0.20
    let numberFormatter = NumberFormatter()
    
    override var nibName: String? {
        return "MainViewController"
    }
    
    override func viewDidLoad() {
        tenPercentButton.titleLabel?.text = "🧐 POOR SERVICE"
        fifteenPercentButton.titleLabel?.text = "😏 I EXPECTED IT"
        twentyPercentButton.titleLabel?.text = "😍 ABOVE & BEYOND"
        
        priceOfMeal.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func tenPercentTapped(sender: UIButton) {
        if priceOfMeal.text == "" {
            youPayCleverStatement.text = "Please Enter Price!"
            return
        }
        youPayCleverStatement.text = "🤬 Oh Hell Naw! Only Pay:"
        if let cost = priceOfMeal.text?.currencyInputFormatting() {
            let moneyValue = cost.dropFirst()
            let costOfTip = Double(moneyValue)! * tenPercentTip
            let totalCostOfEverything = costOfTip + Double(moneyValue)!
            amountToPayForMeal.text = NumberFormatter.localizedString(from: NSNumber(value: totalCostOfEverything), number: .currency)
        }
        
    }
    
    @IBAction func fifteenPercentTapped(sender: UIButton) {
        if priceOfMeal.text == "" {
            print("Uh oh, you didn't enter the price of the meal.")
            return
        }
        youPayCleverStatement.text = "😏 Cool.  You Pay:"
        if let cost = priceOfMeal.text?.currencyInputFormatting() {
            let moneyValue = cost.dropFirst()
            let costOfTip = Double(moneyValue)! * fifteenPercentTip
            let totalCostOfEverything = costOfTip + Double(moneyValue)!
            amountToPayForMeal.text = NumberFormatter.localizedString(from: NSNumber(value: totalCostOfEverything), number: .currency)
        }
        
    }
    
    @IBAction func twentryPercentTapped(sender: UIButton) {
        if priceOfMeal.text == "" {
            print("Uh oh, you didn't enter the price of the meal.")
            return
        }
        youPayCleverStatement.text = "🤩 They Earned It!  Pay:"
        if let cost = priceOfMeal.text?.currencyInputFormatting() {
            let moneyValue = cost.dropFirst()
            let costOfTip = Double(moneyValue)! * twentyPercentTip
            let totalCostOfEverything = costOfTip + Double(moneyValue)!
            amountToPayForMeal.text = NumberFormatter.localizedString(from: NSNumber(value: totalCostOfEverything), number: .currency)
        }
        
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if let amountString = priceOfMeal.text?.currencyInputFormatting() {
            priceOfMeal.text = amountString
        }
    }
}


