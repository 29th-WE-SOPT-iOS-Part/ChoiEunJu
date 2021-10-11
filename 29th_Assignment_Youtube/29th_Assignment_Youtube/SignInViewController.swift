//
//  ViewController.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/07.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func touchUpToSendName(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}

