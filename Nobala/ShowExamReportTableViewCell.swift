//
//  ShowExamReportTableViewCell.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ShowExamReportTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ShowExamText: UILabel!
    @IBOutlet weak var ShowExamTitle: UILabel!
    @IBOutlet weak var ShowExamDegree: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
