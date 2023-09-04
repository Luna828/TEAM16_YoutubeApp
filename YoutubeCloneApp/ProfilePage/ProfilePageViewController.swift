//
//  ProfilePage.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/04.
//

import UIKit

class ProfilePageViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    var name: String = "한솔"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
 
    }
    
}




extension ProfilePageViewController: UITableViewDelegate {
    
    // 셀 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if indexPath.row == 0 {
            return 120.0
        } else {
            return 70.0
        }
    }
    
    // 셀 누를때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
           tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
}

extension ProfilePageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderTableViewCell
            cell.nameLabel.text = name

            if let lastCharacter = name.last {
                cell.viewName.text = String(lastCharacter)
            } else {
                cell.viewName.text = ""
            }
            
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.icon.image = list[indexPath.row].icon
            cell.label.text = list[indexPath.row].title
            
            let iconImage = list[indexPath.row].icon
            cell.icon.image = iconImage.withTintColor(.black, renderingMode: .alwaysOriginal)
            
            
            return cell
        }
        
        
        
    }
    
}
