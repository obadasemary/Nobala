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
        self.clientObject = NobalaClient.sharedInstance()
        self.clientObject?.newsProtocol = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func onReceiveNews(news: [News])
    {
        
        
        self.newsArray = news
    }
    func onReceiveEvents(news: [Event])
    {
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
