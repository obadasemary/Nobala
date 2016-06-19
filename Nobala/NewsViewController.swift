//
//  NewsViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ASProgressHud

class NewsViewController: UIViewController, ViewWebServiceProtocol, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var clientObject: NobalaClient?
    var newsArray = [News]()
    var selectedNews:News = News()
    var newsDetailsView:NewsDetailsViewController = NewsDetailsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
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
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return self.newsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let tableViewCell = self.newsTableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath: indexPath) as! NewsTableViewCell
        
        tableViewCell.NewsTitle.text = newsArray[indexPath.row]._title
        
        tableViewCell.NewsText.text = newsArray[indexPath.row]._description
        return tableViewCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("showNewsDetailsSegue", sender: self)
        self.selectedNews = newsArray[indexPath.row]
        self.newsDetailsView.news = self.selectedNews
//        self.newsDetailsView.newsDetailsTitle.text = self.selectedNews._title
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if (segue.identifier == "showNewsDetailsSegue")
        {
            
            // initialize new view controller and cast it as your view controller
            self.newsDetailsView = segue.destinationViewController as! NewsDetailsViewController
        }
        
    }
    
    func onReceiveNews(news: [News])
    {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.newsArray = news
            self.newsTableView.reloadData()
            ASProgressHud.hideHUDForView(self.view, animated: true)
        })
        
    }
    
    func onReceiveEvents(news: [Event])
    {
    
    }
    
    func onReceiveMainPages(mainPages: [MainPages]) {
        
    }
}
