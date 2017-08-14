//
//  ViewController.swift
//  CustomTextField
//
//  Created by Alii Shareef on 8/13/17.
//  Copyright © 2017 Alii Shareef. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtWage: CurrencyTextField!
    @IBOutlet weak var txtPrice: CurrencyTextField!
    
    @IBOutlet weak var lblHours: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        calcButton.backgroundColor = #colorLiteral(red: 0.9135910869, green: 0.4319670498, blue: 0.2083321512, alpha: 1)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcButton.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        txtWage.inputAccessoryView = calcButton
        txtPrice.inputAccessoryView = calcButton
        txtWage.delegate = self
        txtPrice.delegate = self
        hideShowLabels(hidden: true)
     
    }
    
    
    @IBAction func textEdidtingChanged(_ sender: UITextField) {
        if sender.text!.count > 0, !(sender.text?.contains("$"))!{
            let tempTxt = "$" + sender.text!
            sender.text = tempTxt
        } else if sender.text!.count == 1 && sender.text!.contains("$"){
            sender.text = ""
        }
        
    }
    
    
  
  
    @objc func calculate(){
        if var wagetxt = txtWage.text, var pricetxt = txtPrice.text {
            if wagetxt.contains("$"){
                wagetxt.remove(at: wagetxt.index(of: "$")!)
            }
            if pricetxt.contains("$"){
                 pricetxt.remove(at: pricetxt.index(of: "$")!)
                
            }
            
            if let wage = Double(wagetxt), let price = Double(pricetxt){
                view.endEditing(true)
                hideShowLabels(hidden: false)
                lblHours.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (Double(string) != nil){
           return true
        } else if string.contains(".") && !textField.text!.contains(".") {
            return true
            
        } else if range.lowerBound != range.upperBound {
            return true
        }
        return false
    }
    
    
    func hideShowLabels(hidden state: Bool){
        lblHours.isHidden = state
        lblTitle.isHidden = state
    }
    
    @IBAction func clearCalcPressed(_ sender: Any) {
        hideShowLabels(hidden: true)
        txtPrice.text = ""
        txtWage.text = ""
    }
    
}

