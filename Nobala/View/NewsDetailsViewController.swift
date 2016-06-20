//
//  NewsDetailsViewController.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/18/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var newsDetailsTitle: UILabel!
    @IBOutlet weak var newsDetailsLable: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    var news:News = News()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newsDetailsTitle.text = self.news._details
        self.newsDetailsLable.text = self.news._title
        self.newsImage.kf_setImageWithURL(NSURL(string: self.news._imageUrl)!, placeholderImage: nil)
        self.newsDetailsLable.sizeToFit()

        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
}
