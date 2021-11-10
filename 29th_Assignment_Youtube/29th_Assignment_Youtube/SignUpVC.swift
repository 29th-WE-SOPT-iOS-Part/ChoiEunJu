//
//  SignUpVC.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/07.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: - Vars & Lets Part
    
    var isPasswordVisible = false {
        didSet {
            passwordTextField.isSecureTextEntry = !isPasswordVisible
            setCheckboxStateImage()
        }
    }
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
 
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        
        nameTextField.delegate = self
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - Custom Method Part
    
    func setCheckboxStateImage() {
        if isPasswordVisible {
            checkButton.setImage(UIImage.init(systemName: "checkmark.square.fill"), for: .normal)
            checkButton.tintColor = UIColor.systemBlue
        } else {
            checkButton.setImage(UIImage.init(systemName: "square"), for: .normal)
            checkButton.tintColor = UIColor.opaqueSeparator
        }
    }

    // MARK: - IBAction Part
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if nameTextField.text?.isEmpty == false &&
            idTextField.text?.isEmpty == false &&
            passwordTextField.text?.isEmpty == false {
        nextButton.isEnabled = true
        }
    }
    @IBAction func touchUpToChangeImage(_ sender: UIButton) {
        isPasswordVisible = !isPasswordVisible
    }
 
    @IBAction func touchUpToGoNext(_ sender: Any) {
        requestSignUp()
//        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
//
//        nextVC.name = nameTextField.text
//        nextVC.modalPresentationStyle = .fullScreen
//        self.present(nextVC, animated: true, completion: nil)
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인" ,style: .default) {_ in
            if message == "회원가입 성공" {
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
                
                nextVC.name = self.nameTextField.text
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true, completion: nil)
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Extension Part

extension SignUpVC: UITextFieldDelegate {
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
}

extension SignUpVC {
    func requestSignUp(){
        UserSignService.shared.signUp(email: idTextField.text ?? "", name: nameTextField.text ?? "", password: passwordTextField.text ?? "") {
            responseData in switch responseData{
            case .success(let loginResponse):
                print("\(loginResponse)")
                self.simpleAlert(title: "회원가입", message: "회원가입 성공")
            case .requestErr(let msg):
                print("requestERR \(msg)")
            case .pathErr:
                print("pathErr")
                self.simpleAlert(title: "회원가입", message: "이미 사용중인 이메일입니다.")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
