//
//  ViewController.swift
//  Tipster
//
//  Created by isai on 8/29/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var tipBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "0%"
        totalLabel.text = "$0.00"
        tipBar.alpha = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func computeTip()
    {
        //Get tip percentage
        let tipPercentage:Double = Double(tipSlider.value)
        
        //Get bill amount for which tip is to be calculated
        let billAmount = Double((billField.text as NSString).doubleValue)
        
        //Calculate Tip
        let tipString = String(format: "%d",Int(tipPercentage))
        let tip = (billAmount * tipPercentage)/100
        let total:Double = billAmount + tip
        let totalString = String(format: "%0.2f",total)
        
        tipLabel.text = "\(tipString)%"
        totalLabel.text = "$\(totalString)"
    }
    
    @IBAction func onEditingCanged(sender: AnyObject) {
        tipBar.alpha = 1.0
        computeTip()
    }
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        view.endEditing(true)
        computeTip()
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        tipBar.alpha = 0.0
    }
}

