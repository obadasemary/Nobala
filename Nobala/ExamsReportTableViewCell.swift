//
//  ExamsReportTableViewCell.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/25/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ExamsReportTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ExamText: UILabel!
    @IBOutlet weak var ExamTitle: UILabel!
    @IBOutlet weak var ExamDegree: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
