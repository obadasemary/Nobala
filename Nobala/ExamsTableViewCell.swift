//
//  ExamsTableViewCell.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/22/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ExamsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ExamsText: UILabel!
    @IBOutlet weak var ExamsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
