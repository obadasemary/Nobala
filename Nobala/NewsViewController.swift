//
//  NewsViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ASProgressHud
import Kingfisher
import ENSwiftSideMenu

class NewsViewController: UIViewController, ViewWebServiceProtocol, UITableViewDelegate, UITableViewDataSource, ENSideMenuDelegate {
    
    // MARK: - SideMenu
//    var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var sideMenu:ENSideMenu?
    
    var window: UIWindow?
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var clientObject: NobalaClient?
    var newsArray = [News]()
    var selectedNews:News = News()
    var newsDetailsView:NewsDetailsViewController = NewsDetailsViewController()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self

        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        let logo = UIImage(named: "newsIcon.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.clientObject = NobalaClient.sharedInstance()
        self.clientObject?.webServiceProtocol = self
        

    }
    
    override func viewWillAppear(animated: Bool)
    {
        NSThread.sleepForTimeInterval(0.05)
        
        let leftView = storyboard?.instantiateViewControllerWithIdentifier("LeftMenuController") as!leftViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: leftView, menuPosition: .Left)
        self.sideMenu!.delegate = self
    }
    
    // MARK: - SideMenuButton
    func sideMenuWillOpen() {
        print("NewsSideMenuWillOpen")
    }
    
    
    @IBAction func toggle(sender: AnyObject)
    {
        if ((self.sideMenu?.isMenuOpen) == false)
        {
            self.sideMenu?.showSideMenu()

        }
        else
        {
            self.sideMenu?.hideSideMenu()
        }
    }
    
//    @IBAction func showLeftMenu(sender: AnyObject)
//    {
//    
//        showSideMenuView()
////        toggleSideMenuView()
////        self.controller.toggle("right")
//    }
    
    @IBAction func goToHome(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let tableViewCell = self.newsTableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath: indexPath) as! NewsTableViewCell
        
        tableViewCell.NewsTitle.text = newsArray[indexPath.row]._title
        
        tableViewCell.NewsText.text = newsArray[indexPath.row]._description
        
        dispatch_async(dispatch_get_main_queue()) { 
            
            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)

            tableViewCell.NewsPhoto.kf_setImageWithURL(NSURL(string: self.newsArray[indexPath.row]._imageUrl)!, placeholderImage: nil)
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }
        
        
        
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
    
    func onGetAccessToken(users: [Users]) {
        
    }
    
    func onGetCurrentExams(exams: [Exams]) {
        
    }
    
    func onGetCurrentHomeWork(homework: [HomeWork]) {
        
    }
    
    func onGetHomeWorkStudentReport(report: [HomeWorkStudentReport]) {
        
    }
    
    func onExamsTeacherFollowUp(examsTeacherFollowUp: [ExamsTeacherFollowUp]) {
        
    }
    
    func onFieldLogin() {
        
    }
}
