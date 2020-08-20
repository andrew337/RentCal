//
//  HomeViewController.swift
//  RentCalc
//
//  Created by Admin on 8/1/20.
//  Copyright © 2020 Holmes Org. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var lowValue = "0.0"
    var midValue = "0.0"
    var highValue = "0.0"
    
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var affordButtonLabel: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incomeTextField.delegate = self
        expenseTextField.delegate = self
        savingsTextField.delegate = self
        errorLabel.alpha = 0
//        view.backgroundColor = UIColor(red: 0.32, green: 0.92, blue: 0.92, alpha: 1.00)
        affordButtonLabel.layer.cornerRadius = 20
//        titleLabel.textColor = UIColor(red: 0.94, green: 0.26, blue: 0.22, alpha: 1.00)
//        secondTitleLabel.textColor = UIColor(red: 1.00, green: 0.62, blue: 0.46, alpha: 1.00)
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        nextScreen()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Results" {
            let destionationVC = segue.destination as! SecondViewController
            destionationVC.lowValue = lowValue
            destionationVC.midValue = midValue
            destionationVC.highValue = highValue
        }
    }
    
    
    func nextScreen() {
        
        if incomeTextField.text!.isEmpty {
            let color = UIColor.red
            let placeholder = incomeTextField.placeholder ?? ""
            incomeTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
            incomeTextField.placeholder = "Please enter Income"
        }
        else if (expenseTextField.text!.isEmpty) {
            expenseTextField.placeholder = "Please enter Expenses"
        }
        else if  savingsTextField.text!.isEmpty {
            savingsTextField.placeholder = "Please enter Savings"
        }
        else {
            
            let income = Double(incomeTextField.text!)!
            let expense = Double(expenseTextField.text!)!
            let savings = Double(savingsTextField.text!)!
            
            
            let lowCost = ((income - (expense + savings)) * 0.15)
            let midCost = (income - (expense + savings)) * ( 30 / 100)
            let highCost = (income - (expense + savings)) * ( 60 / 100)
            
            if lowCost < 0 || midCost < 0 || highCost < 0 {
                errorLabel.text = "Results yeild a negative result. Please try again"
                errorLabel.alpha = 1
            } else {
            
            lowValue = String(format: "%.0f", lowCost)
            midValue = String(format: "%.0f", midCost)
            highValue = String(format: "%.0f", highCost)
            
            
            performSegue(withIdentifier: "Results", sender: self)
            }
        }
    }
    
   
    
    
    
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
}
