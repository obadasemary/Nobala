//
//  HomeWorkReportTableViewCell.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/25/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class HomeWorkReportTableViewCell: UITableViewCell {
    
    @IBOutlet weak var HomeworkReportText: UILabel!
    @IBOutlet weak var HomeworkReportTitle: UILabel!
    @IBOutlet weak var HomeworkReportDegree: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
