//
//  NewsTableViewCell.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/14/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var NewsPhoto: UIImageView!
    
    @IBOutlet weak var NewsTitle: UILabel!
    
    @IBOutlet weak var NewsText: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
