//
//  NewsViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, ViewWebServiceProtocol {

    var clientObject: NobalaClient?
    var newsArray = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "newsIcon.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        
        self.clientObject = NobalaClient.sharedInstance()
        self.clientObject?.webServiceProtocol = self

    }
    
    @IBAction func goToHome(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    

    func onReceiveNews(news: [News])
    {
        
        
        self.newsArray = news
    }
    
    func onReceiveEvents(news: [Event])
    {
    
    }
}
