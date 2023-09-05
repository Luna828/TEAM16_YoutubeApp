//
//  RegisterViewController.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/04.
//

import UIKit

class RegisterPage: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var checkPwdTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = ""
        
        nameTextField.layer.borderColor = UIColor.darkGray.cgColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.cornerRadius = 10.0
        emailTextField.layer.borderColor = UIColor.darkGray.cgColor
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 10.0
        checkPwdTextField.layer.borderColor = UIColor.darkGray.cgColor
        checkPwdTextField.layer.borderWidth = 1.0
        checkPwdTextField.layer.cornerRadius = 10.0
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        checkPwdTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        registerButton.isEnabled = false
    }

    @objc func textFieldDidChange() {
        //이메일과 비밀번호 예시
        //123@example.com
        //PassW0rd!
        if let nameText = nameTextField.text,
           let emailText = emailTextField.text,
           let passwordText = passwordTextField.text,
           let checkPwdText = checkPwdTextField.text
        {
            let isEmailValid = emailText.isValidEmail()
            let isPasswordValid = passwordText.isValidPassword()
            let isCheckedPwdValid = checkPwdText == passwordText
                    
            registerButton.isEnabled = !nameText.isEmpty && !emailText.isEmpty && !passwordText.isEmpty && !checkPwdText.isEmpty && isEmailValid && isPasswordValid && isCheckedPwdValid
        } else {
            registerButton.isEnabled = false
        }
        
        UIView.animate(withDuration: 0.3) {
            if self.registerButton.isEnabled {
                self.registerButton.backgroundColor = UIColor.red
            } else {
                self.registerButton.backgroundColor = UIColor.lightGray
            }
        }
    }
}

// 비밀번호 정규 표현식
extension String {
    // 대소문자, 특수문자, 숫자 8자 이상일 때 -> true
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @와2글자 이상 확인
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}
