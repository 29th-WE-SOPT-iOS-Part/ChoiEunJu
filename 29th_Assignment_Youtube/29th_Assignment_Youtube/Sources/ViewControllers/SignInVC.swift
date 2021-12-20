//
//  SignInVC.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/07.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        
        nameTextField.delegate = self
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - IBAction Part
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if nameTextField.text?.isEmpty == false &&
            idTextField.text?.isEmpty == false &&
            passwordTextField.text?.isEmpty == false {
        nextButton.isEnabled = true
        }
    }
    
    @IBAction func touchUpToGoResultVC(_ sender: Any) {
        requestLogin()
    }
    
    @IBAction func touchUpToGoSignUpVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: SignUpVC.className) else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인" ,style: .default) {_ in
            if message == "로그인 성공" {
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: ResultVC.className) as? ResultVC else {return}
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true, completion: nil)
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Extension Part

extension SignInVC: UITextFieldDelegate {
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

extension SignInVC {
    func requestLogin(){
        UserSignService.shared.login(email: idTextField.text ?? "", password: passwordTextField.text ?? "") {
            responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? SignResponseData else { return }
                if response.data != nil {
                    UserDefaults.standard.set(self.nameTextField.text, forKey: "userName")
                    self.simpleAlert(title: "로그인", message: "로그인 성공")
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
            case .pathErr:
                print("pathErr")
                self.simpleAlert(title: "로그인", message: "존재하지 않는 회원입니다.")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}

extension UIViewController {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}

