//
//  ProfilePage.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/04.
//

import UIKit

class ProfilePageViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        //tableView.dataSource = self
 
    }

    
}


extension ProfilePageViewController: UITableViewDelegate {
    
    
}

//extension ProfilePageViewController: UITableViewDataSource {
   
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
    
    
//}



