//
//  RegisterViewController.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/04.
//

import UIKit

class RegisterPage: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPwdTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = ""
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        checkPwdTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        registerButton.isEnabled = false

    }

    @objc func textFieldDidChange(){
        if let nameText = nameTextField.text,
           let emailText = emailTextField.text,
           let passwordText = passwordTextField.text,
           let checkPwdText = checkPwdTextField.text {
            registerButton.isEnabled = !nameText.isEmpty && !emailText.isEmpty && !passwordText.isEmpty && !checkPwdText.isEmpty
        } else {
            registerButton.isHidden = false
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
