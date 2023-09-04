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
    
    @IBAction func emailTextField(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
