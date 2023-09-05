//
//  EditViewController.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0048 on 2023/09/05.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    var delegate: PerformSegue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTextField.delegate = self
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        if let editName = editTextField.text, !editName.isEmpty {
            delegate?.sendName(name: editName)
            UserDataManager.shared.updateInfo(name: editName)
        }
        navigationController?.popViewController(animated: true)
    }
    
}

extension EditViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "입력하세요"
            return false
        } else {
            return true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 글자수 제한
        let maxLength = 5
        let currentString : NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
}
    
    

