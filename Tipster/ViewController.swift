//
//  ViewController.swift
//  Tipster
//
//  Created by isai on 8/29/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let tipPercentages = [0.18,0.2,0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = Double((billField.text as NSString).doubleValue)
        let tip = billAmount * tipPercentage
        let tipString = String(format: "$%0.2f",tip)
        let total:Double = billAmount + tip
        let totalString = String(format: "$%0.2f",tip)
        
        tipLabel.text = "$\(tipString)";
        totalLabel.text = "$\(totalString)"
        
        tipLabel.text = String(format: "$%0.2f",tip)
        totalLabel.text = String(format: "$%0.2f",total)

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

