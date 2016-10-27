//
//  homeWorkTableViewCell.swift
//  Nobala
//
//  Created by Ayman Gomaa on 10/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

protocol homeWorkTableViewCellDelegate: class {
    func openHomeworkWebView(ID: Int)
}

class homeWorkTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var NewsTitle: UILabel!
    @IBOutlet weak var NewsText: UILabel!
    @IBOutlet weak var attachmentImageView: UIImageView!
    weak var delegate: homeWorkTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.attachmentImageTapped(_:)))
        self.attachmentImageView.addGestureRecognizer(tapGesture)
    }
    
    func attachmentImageTapped(gesture: UITapGestureRecognizer) {
        self.delegate?.openHomeworkWebView(gesture.view!.tag)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
