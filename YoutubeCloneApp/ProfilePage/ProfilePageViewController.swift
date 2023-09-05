//
//  ProfilePage.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/04.
//

import UIKit

protocol PerformSegue {
    func performSegue()
    func sendName(name: String)
}

class ProfilePageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            //userModel.name = userName
        }
    }
    
}


// MARK: -UITableViewDelegate
extension ProfilePageViewController: UITableViewDelegate {
    
    // 셀 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if indexPath.row == 0 {
            return 120.0
        } else {
            return 65.0
        }
    }
    
    // 셀 누를때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}


// MARK: -UITableViewDataSource
extension ProfilePageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderTableViewCell
            cell.delegate = self
            //cell.nameLabel.text = userModel.name
            
//            if let lastCharacter = userModel.name.last {
//                cell.viewName.text = String(lastCharacter)
//            } else {
//                cell.viewName.text = ""
//            }
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.icon.image = list[indexPath.row].icon
            cell.label.text = list[indexPath.row].title
            
            if list[indexPath.row].title == "내 premium 혜택" ||
                list[indexPath.row].title == "Youtube 스튜디오" ||
                list[indexPath.row].title == "Youtube Music"{
                cell.icon.image = list[indexPath.row].icon.withTintColor(.red, renderingMode: .alwaysOriginal)
            } else {
                cell.icon.image = list[indexPath.row].icon.withTintColor(.black, renderingMode: .alwaysOriginal)
            }
            return cell
        }
    }
    
}


// MARK: -PerformSegue
extension ProfilePageViewController: PerformSegue {
    
    func performSegue() {
        self.performSegue(withIdentifier: "goEdit", sender: self)
    }
    
    func sendName(name: String) {
        let indexPath = IndexPath(row: 0, section: 0)
        if let headerCell = tableView.cellForRow(at: indexPath) as? HeaderTableViewCell {
            headerCell.nameLabel.text = name
            if let lastCharacter = name.last {
                headerCell.viewName.text = String(lastCharacter)
            } else {
                headerCell.viewName.text = ""
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goEdit" {
            let nextVC = segue.destination as! EditViewController
            nextVC.delegate = self
        }
    }
    
}
