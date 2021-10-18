//
//  SignInViewController.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/07.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
    }
    
    // MARK: - IBAction Part
    
    @IBAction func touchUpToSendName(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToGoSignUpVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

