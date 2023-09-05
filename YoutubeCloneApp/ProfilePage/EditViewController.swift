//
//  EditViewController.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0048 on 2023/09/05.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var editTextField: UITextField!
    var delegate: PerformSegue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        if let editName = editTextField.text {
            delegate?.sendName(name: editName)
            UserDefaults.standard.set(editName, forKey: "userName")
        }
        self.dismiss(animated: true)
    }
    
}
