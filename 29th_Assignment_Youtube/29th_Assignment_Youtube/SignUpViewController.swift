//
//  SignUpViewController.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/07.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var checkButton: UIButton!
    
    // MARK: - Custom Method Part
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // 키보드 사라지도록
        if textField == self.nameTextField {
            textField.resignFirstResponder()
            self.idTextField.becomeFirstResponder()
        }
        else if textField == self.idTextField {
            textField.resignFirstResponder()
            self.passwordTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
        
    }
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
    }

    // MARK: - IBAction Part
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if nameTextField.text?.isEmpty == false && idTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false{
        nextButton.isEnabled = true
        }
    }
    @IBAction func touchUpToChangeImage(_ sender: UIButton) {
        if checkButton.isSelected {
            checkButton.setImage(UIImage.init(systemName: "checkmark.square.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
            checkButton.isSelected = false
        } else {
            checkButton.setImage(UIImage.init(systemName: "checkmark.square"), for: .normal)
            passwordTextField.isSecureTextEntry = true
            checkButton.isSelected = true
        }
    }
 
    @IBAction func touchUpToGoNext(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
