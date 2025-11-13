//
//  ViewController.swift
//  TW31D040525
//
//  Created by Roman De Angel on 11/5/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblDisplay: UILabel!
    
    var previousNum = 0.0
    var currentOperator: String? = nil
    var isArithOperIsSelect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnNum(_ sender: UIButton) {
        if let strNum = sender.titleLabel?.text {
            if lblDisplay.text == "0" || isArithOperIsSelect {
                lblDisplay.text = ""
                isArithOperIsSelect = false
            }
            lblDisplay.text! += strNum
        }
    }
    
    @IBAction func btnArithOper(_ sender: UIButton) {
        if let oper = sender.titleLabel?.text {
            previousNum = Double(lblDisplay.text!) ?? 0.0
            currentOperator = oper
            isArithOperIsSelect = true
        }
    }
    
    @IBAction func btnEqual(_ sender: Any) {

        let currentNum = Double(lblDisplay.text!) ?? 0.0
              var result = 0.0
              
              switch currentOperator {
              case "+":
                  result = previousNum + currentNum
              case "-":
                  result = previousNum - currentNum
              case "×":
                  result = previousNum * currentNum
              case "÷":
                  result = currentNum != 0 ? previousNum / currentNum : 0
              default:
                  result = currentNum
              }
              
              lblDisplay.text = String(result)
              previousNum = result
              currentOperator = nil

    }
    
    @IBAction func clear(_ sender: Any) {
        lblDisplay.text = "0"
        previousNum = 0.0
        currentOperator = nil
        isArithOperIsSelect = false
    }
    
    @IBAction func btnPlusMinus(_ sender: Any) {
        if let currentText = lblDisplay.text, let num = Double(currentText) {
            let toggledNum = num * -1
            lblDisplay.text = String(toggledNum)
        }
    }
    
    @IBAction func btnPercent(_ sender: Any) {
        if let currentText = lblDisplay.text, let num = Double(currentText) {
            let percentValue = num / 100
            lblDisplay.text = String(percentValue)
        }
    }
    
    
}

