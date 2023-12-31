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
    
    @IBAction func registerButton(_ sender: Any) {
        if let name = nameTextField.text,
           let email = emailTextField.text,
           let password = passwordTextField.text
        {
            let newUser = UserModel(name: name, email: email, password: password)
            
            UserDataManager.shared.addUser(newUser)
            print("성공\(UserDataManager.shared.getUsers())")
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("성공\(UserDataManager.shared.getUsers())")
        registerButton.isEnabled = false // 버튼이 눌리지 않게 비활성화
        navigationItem.title = ""
       
        setupTextField()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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

    @objc func toggleCheckPasswordVisibility() {
        checkPwdTextField.isSecureTextEntry.toggle()
        updateShowCheckPwdButtonImage(isSecure: checkPwdTextField.isSecureTextEntry)
    }
    
    private func updateShowPasswordButtonImage(isSecure: Bool) {
        let imageName = isSecure ? "eye" : "eye.fill"
        showPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }

    private func updateShowCheckPwdButtonImage(isSecure: Bool) {
        let imageName = isSecure ? "eye" : "eye.fill"
        showCheckPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
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
        
        showCheckPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        showCheckPasswordButton.tintColor = UIColor.black
        showCheckPasswordButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        showCheckPasswordButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        showCheckPasswordButton.addTarget(self, action: #selector(toggleCheckPasswordVisibility), for: .touchUpInside)
        
        passwordTextField.rightView = showPasswordButton
        passwordTextField.rightViewMode = .always
        checkPwdTextField.rightView = showCheckPasswordButton
        checkPwdTextField.rightViewMode = .always
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        checkPwdTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
}
