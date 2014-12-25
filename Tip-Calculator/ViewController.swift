//
//  ViewController.swift
//  Tip-Calculator
//
//  Created by PASCAL ARINGO ODEK on 12/25/14.
//  Copyright (c) 2014 Pascal Odek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalTextField: UITextField!
    
    @IBOutlet weak var taxPctslider: UISlider!
    
    @IBOutlet weak var taxPctLabel: UILabel!
    
    @IBOutlet weak var resultsTextView: UITextView!
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    
    func refreshUI() {
        // 1
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        // 2
        taxPctslider.value = Float(tipCalc.taxPct) * 100.0
        // 3
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctslider.value))%)"
        // 4
        resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func calculateTapped(sender: AnyObject) {
        
        
        // 1
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        // 2
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        // 3
//        var keys = Array(possibleTips.keys)
//        sort(&keys)
//        for tipPct in keys {
//            let tipValue = possibleTips[tipPct]!
//            let prettyTipValue = String(format:"%.2f", tipValue)
//            results += "\(tipPct)%: \(prettyTipValue)\n"
//        }
        
        
        for (tipPct, tipValue) in possibleTips {
            // 4
            results += "\(tipPct)%: \(tipValue)\n"
        }
        // 5
        resultsTextView.text = results
    }
    
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        
        tipCalc.taxPct = Double(taxPctslider.value) / 100.0
        refreshUI()
    }

    @IBAction func viewTapped(sender: AnyObject) {
        
        totalTextField.resignFirstResponder()
    }
    
    
    
}

