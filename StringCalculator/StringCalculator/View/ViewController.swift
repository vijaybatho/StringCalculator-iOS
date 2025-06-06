//
//  ViewController.swift
//  StringCalculator
//
//  Created by Vijay Batho on 05/06/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonCalculate: UIButton!
    
    private let stringCalculatorViewModel = StringCalculatorViewModel()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
    }
    
    //MARK: Initial Setup
    func initialSetup() {
        inputTextField.delegate = self
        inputTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        applyGradientBackground()
        resultLabel.isHidden = true
        resultTitleLabel.isHidden = true
        cardView.layer.cornerRadius = 12
        cardView.layer.masksToBounds = true
        buttonCalculate.layer.cornerRadius = 12
        buttonCalculate.layer.masksToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: Apply Gradient Background
    func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        // Colors: Match the purple-pink-orange-yellow transition
        gradientLayer.colors = [
            UIColor(red: 0.90, green: 0.36, blue: 0.51, alpha: 1.0).cgColor, // pinkish
            UIColor(red: 0.98, green: 0.73, blue: 0.37, alpha: 1.0).cgColor, // orange-yellow
            UIColor(red: 0.48, green: 0.42, blue: 0.95, alpha: 1.0).cgColor  // purple
        ]
        
        // Smooth diagonal gradient
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonCalculateClicked(_ sender: UIButton) {
        print("Calculate button tapped")
        view.endEditing(true)
        let input = inputTextField.text ?? ""
        
        do {
            let result = try stringCalculatorViewModel.calculateResult(from: input)
            resultLabel.text = result
            resultLabel.isHidden = result.isEmpty
            resultTitleLabel.isHidden = result.isEmpty
        } catch let error as StringCalculatorError {
            switch error {
            case .negativeNumbersNotAllowed(let negatives):
                showAlert(message: "Negative numbers not allowed: \(negatives.map { String($0) }.joined(separator: ", "))")
            }
            resultLabel.isHidden = true
            resultTitleLabel.isHidden = true
        } catch {
            showAlert(message: "Unknown error occurred.")
            resultLabel.isHidden = true
            resultTitleLabel.isHidden = true
        }
        
    }
    
}

//MARK: UI Text Field Delegate Methods
extension ViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
                let cleaned = text.components(separatedBy: .whitespaces).filter { !$0.isEmpty }.joined()
                textField.text = cleaned
                print("Cleaned text: \(cleaned)")
            }
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        print("Text changed: \(textField.text ?? "")")
    }
    
}
