//
//  DailyWorkTableViewCell.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/28/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class DailyWorkTableViewCell: UITableViewCell {

    @IBOutlet weak var DailyTitle: UILabel!
    @IBOutlet weak var DailyDate: UILabel!
    @IBOutlet weak var DailyTextArea: UITextView!
    @IBOutlet weak var DailyTextAreaTitle: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
