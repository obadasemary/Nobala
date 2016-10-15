//
//  homeWorkViewController.swift
//  Nobala
//
//  Created by Ayman Gomaa on 10/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//


import UIKit
import ASProgressHud
//import Kingfisher
import ENSwiftSideMenu
import KeychainAccess


class homeWorkViewController: UIViewController, ViewWebServiceProtocol, UITableViewDelegate, UITableViewDataSource, ENSideMenuDelegate {
    
    var sideMenu:ENSideMenu?
    
    var window: UIWindow?
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var clientObject: NobalaClient?
    var hWArray = []
    var selectedhw:HomeWork = HomeWork()
    
    
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    

    
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
        
        /*
 
 
 
 */
        
        
        let keychain = Keychain(service: "Noblaa.app")
        if let Userauth_token : String = keychain["auth_token"] {
        NobalaClient.sharedInstance().getCurrentHomeWork(Userauth_token, completionHandler: { (success, errorMessage, myHomeWork) in
            
            if !success {
                
                var message = "Unknown error, please try again"
                
                if errorMessage == "invalid_Data" {
                    
                    message = "Pleas Make Sure  is correct"
                }
                
                let alertController = UIAlertController(title: "Oops", message: message, preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                return
            }
            
            // You have the user
            
            
            
            
            self.hWArray = myHomeWork
            print(user )
             ASProgressHud.hideHUDForView(self.view, animated: true)
            self.newsTableView.reloadData()
        
            
            
        }) { (error, errorMessage) in
            
            let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }

        
        
        
        
        }
        
        
        
        
        //
//        NobalaClient.sharedInstance().getCurrentHomeWork(NobalaClient.Token.accessToken,completionHandler : { (success, errorMessage,myHomeWorkdata)in
//            
//            if !success {
//                
//                var message = "Unknown error, please try again"
//                
//                if errorMessage == "invalid_grant" {
//                    
//                    message = "Pleas Make Sure Username & Password is correct"
//                }
//                
//                let alertController = UIAlertController(title: "Oops", message: message, preferredStyle: .Alert)
//                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//                
//                self.presentViewController(alertController, animated: true, completion: nil)
//                
//                return
//            } else {
//                
//                print("yes")
//                
//                
//                ASProgressHud.hideHUDForView(self.view, animated: true)
//                
//                
//            }
//        })
//        
//  
//            
 

        /*
 
 
 
 */




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
        print("return self.hWArray.count" +  String (hWArray.count))
        return self.hWArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let row = indexPath.row
        let tableViewCell = self.newsTableView.dequeueReusableCellWithIdentifier("homeWorkCell", forIndexPath: indexPath) as! homeWorkTableViewCell
        
        tableViewCell.NewsTitle.text = hWArray[row].valueForKey("ScheduleName") as? String
        tableViewCell.NewsText.text = hWArray[row].valueForKey("ScheduleEndDate") as? String
       
        
//        dispatch_async(dispatch_get_main_queue()) {
//            
////            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
////            ASProgressHud.hideHUDForView(self.view, animated: true)
////        }
        
        
        
        return tableViewCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
//        performSegueWithIdentifier("showNewsDetailsSegue", sender: self)
//        self.selectedNews = newsArray[indexPath.row]
//        self.newsDetailsView.news = self.selectedNews
//        //        self.newsDetailsView.newsDetailsTitle.text = self.selectedNews._title
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
//        if (segue.identifier == "showNewsDetailsSegue")
//        {
//            
//            // initialize new view controller and cast it as your view controller
//            self.newsDetailsView = segue.destinationViewController as! NewsDetailsViewController
//        }
//        
    }
    
    func onReceiveNews(news: [News])
    {
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            
//            self.newsArray = news
//            self.newsTableView.reloadData()
//            ASProgressHud.hideHUDForView(self.view, animated: true)
//        })
        
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
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.hWArray = homework
            print(homework)
            
            self.newsTableView.reloadData()
            ASProgressHud.hideHUDForView(self.view, animated: true)
        })
    }
    
    func onGetHomeWorkStudentReport(report: [HomeWorkStudentReport]) {
        
    }
    
    func onExamsTeacherFollowUp(examsTeacherFollowUp: [ExamsTeacherFollowUp]) {
        
    }
    
    func onFieldLogin() {
        
    }

    
    
    
}







