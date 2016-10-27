//
//  ExamsTableViewCell.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/22/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

protocol ExamsTableViewCellDelegate: class {
    func openExamWebView(ID: Int)
}

class ExamsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ExamsText: UILabel!
    @IBOutlet weak var ExamsTitle: UILabel!
    @IBOutlet weak var attachmentImageView: UIImageView!
    weak var delegate: ExamsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.attachmentImageTapped(_:)))
        self.attachmentImageView.addGestureRecognizer(tapGesture)
    }
    
    func attachmentImageTapped(gesture: UITapGestureRecognizer) {
        self.delegate?.openExamWebView(gesture.view!.tag)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
