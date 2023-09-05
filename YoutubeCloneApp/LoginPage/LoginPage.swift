//
//  LoginPage.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/04.
//

import UIKit

class LoginPageViewController: UIViewController {
    var email = String()
    var password = String()
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var rememberButton: UIButton!
    
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기에 로그인 버튼 비활성화
        loginButton.isEnabled = false
        
        setupTextField()
    }
    
    @objc func textFieldDidChange() {
        // email과 password 텍스트 필드가 모두 비어 있지 않으면 로그인 버튼 활성화
        if let emailText = emailTextField.text,
           let passwordText = passwordTextField.text
        {
            let isEmailValid = emailText.isValidEmail()
            let isPasswordValid = passwordText.isValidPassword()
            
            loginButton.isEnabled = !emailText.isEmpty && !passwordText.isEmpty && isEmailValid && isPasswordValid
        } else {
            loginButton.isEnabled = false
        }
            
        // 로그인 버튼의 배경색을 업데이트하고 애니메이션 적용
        UIView.animate(withDuration: 0.3) {
            if self.loginButton.isEnabled {
                self.loginButton.backgroundColor = UIColor.red
            } else {
                self.loginButton.backgroundColor = UIColor.lightGray
            }
        }
    }
        
    @IBAction func emailTextField(_ sender: UITextField) {
        let text = sender.text ?? ""
        email = text
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        let text = sender.text ?? ""
        password = text
    }
    
    @IBAction func loginButton(_ sender: UIButton) {}
    
    @IBAction func registerButton(_ sender: UIButton) {
        if let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterPage") {
            navigationController?.pushViewController(registerVC, animated: true)
        }
    }
    
    @IBAction func rememberEmail(_ sender: Any) {
        isChecked.toggle()
        print(isChecked)
        
        if isChecked {
            // 버튼의 이미지를 체크된 이미지로 변경
            let checkedImage = UIImage(systemName: "checkmark.rectangle.portrait.fill")
            rememberButton.setImage(checkedImage, for: .normal)
        } else {
            // 버튼의 이미지를 체크되지 않은 이미지로 변경
            let uncheckedImage = UIImage(systemName: "checkmark.rectangle.portrait")
            rememberButton.setImage(uncheckedImage, for: .normal)
        }
    }
}

extension LoginPageViewController {
    private func setupTextField() {
        emailTextField.layer.borderColor = UIColor.darkGray.cgColor
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.isSecureTextEntry = true
                
        // emailTextField와 passwordTextField에 대한 editingChanged 이벤트 관찰자 추가
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
}
