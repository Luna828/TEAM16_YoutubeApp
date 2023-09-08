//
//  DetailPageTableViewCell.swift
//  YoutubeCloneApp
//
//  Created by 손영하  on 2023/09/05.
//

import UIKit

class DetailPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var thumnails: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
