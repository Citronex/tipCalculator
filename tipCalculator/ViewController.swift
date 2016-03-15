//
//  ViewController.swift
//  tipCalculator
//
//  Created by Francisco.Mejias on 2/16/16.
//  Copyright © 2016 Booker Inc. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var mealCost: Float?
    var tipPercent: Float = 20.0
    
    func finalCost() -> Float {
        return mealCost! + tipPercent / 100.0 * mealCost!
    }
    
    @IBOutlet var costTextField: UITextField!
    @IBOutlet weak var finalCostLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    func updateFinalCostLabel() {
        if mealCost != nil {
            self.finalCostLabel.text = "\(finalCost())"
        } else if (self.costTextField.text!.isEmpty){
            self.finalCostLabel.text = ""
        } else {
            self.finalCostLabel.text = "Invalid Cost!"
        }
    }
    
    @IBAction func tipSliderChanged(sender: UISlider) {
        self.tipPercent = round(sender.value)
        
        self.tipPercentLabel.text = "\(Int(self.tipPercent))"
        
        updateFinalCostLabel()
    }
    
    @IBAction func costTextFieldChanged(sender: UITextField) {
        self.mealCost = Float(sender.text!)
        
        updateFinalCostLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.costTextField.text = "Yey! We're finally writing code"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
