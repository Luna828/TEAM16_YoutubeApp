//
//  ProfilePage.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/04.
//

import UIKit

class ProfilePageViewController: UIViewController {
    

    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileName: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView(profileView)
       
       
    }
    
    func setupView(_ view: UIView){
        view.layer.cornerRadius = view.frame.height / 2
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
    }
    
    
}
