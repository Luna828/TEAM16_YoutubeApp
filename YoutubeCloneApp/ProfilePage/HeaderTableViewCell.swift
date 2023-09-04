//
//  HeaderTableViewCell.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0048 on 2023/09/05.
//

import UIKit

class HeaderTableViewCell:
    UITableViewCell {
    
    @IBOutlet weak var lableView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lableView.layer.cornerRadius = lableView.frame.size.width / 2
        lableView.clipsToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    
    @IBAction func editButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
    }
    
    
}
