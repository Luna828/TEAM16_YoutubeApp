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
    let showPasswordButton = UIButton(type: .custom)
    let showCheckPasswordButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.isEnabled = false //버튼이 눌리지 않게 비활성화
        navigationItem.title = ""
       
        setupTextField()
    }
    
    @objc func textFieldDidChange() {
        // 이메일과 비밀번호 예시
        // 123@example.com
        // PassW0rd!
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
    
    @objc func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        updateShowPasswordButtonImage(isSecure: passwordTextField.isSecureTextEntry)
    }
    
    private func updateShowPasswordButtonImage(isSecure: Bool) {
            let imageName = isSecure ? "eye" : "eye.fill"
            showPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
}

extension RegisterPage {
    private func setupTextField() {
        nameTextField.layer.borderColor = UIColor.darkGray.cgColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.cornerRadius = 10.0
        emailTextField.layer.borderColor = UIColor.darkGray.cgColor
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.isSecureTextEntry = true
        checkPwdTextField.layer.borderColor = UIColor.darkGray.cgColor
        checkPwdTextField.layer.borderWidth = 1.0
        checkPwdTextField.layer.cornerRadius = 10.0
        checkPwdTextField.isSecureTextEntry = true
        
       
        showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        showPasswordButton.tintColor = UIColor.black
        showPasswordButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        showPasswordButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        showPasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        passwordTextField.rightView = showPasswordButton
        passwordTextField.rightViewMode = .always
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        checkPwdTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
}


