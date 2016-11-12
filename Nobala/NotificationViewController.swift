//
//  NotificationViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/6/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import ASProgressHud
import KeychainAccess

class NotificationViewController: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UIImageView!
    
    var tableData = []
    var selectedTableData: Notification = Notification()
    
    var todayDate: NSDate?
    var todayDateStr: String?
    
    var showNotification: ShowNotificationViewController = ShowNotificationViewController()
    
    @IBOutlet weak var tableView: UITableView!
    
    var sideMenu:ENSideMenu?
    
    var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let keychain = Keychain(service: "Noblaa.app")
        
        if let Userauth_token : String = keychain["auth_token"] {
            
//            let userTypeID = keychain["user_type"]

            NobalaClient.sharedInstance().getNotification(Userauth_token, completionHandler: { (success, errorMessage, myResult) in
                
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
                
                self.tableData = myResult
                
                ASProgressHud.hideHUDForView(self.view, animated: true)
                
                self.tableView.reloadData()
                
                }, fail: { (error, errorMessage) in
                    
                    let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
            })
            
            userName.text = keychain["userFName"]
            
            if keychain["user_type"]! == "1" {
                userType.image = UIImage(named: "MLParant.png")
            } else if keychain["user_type"]! == "2" {
                userType.image = UIImage(named: "MLStudend.png")
            } else {
                userType.image = UIImage(named: "MLTeacher.png")
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        NSThread.sleepForTimeInterval(0.05)
        
        let leftView = storyboard?.instantiateViewControllerWithIdentifier("LeftMenuController") as!leftViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: leftView, menuPosition: .Left)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        //        sideMenu?.menuWidth = screenWidth - 100
        sideMenu?.menuWidth = screenWidth * 0.75
        
        self.sideMenu!.delegate = self
    }
    
    // MARK: - SideMenuButton
    
    func sideMenuWillOpen() {
        print("LearningPlanViewControllerSideMenuWillOpen")
    }
    
    @IBAction func toggle(sender: AnyObject) {
        
        if ((self.sideMenu?.isMenuOpen) == false)
        {
            self.sideMenu?.showSideMenu()
            
        }
        else
        {
            self.sideMenu?.hideSideMenu()
        }
    }
    
    @IBAction func goToHome(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NotificationCell", forIndexPath: indexPath) as! NotificationTableViewCell
        
        cell.notiTitleLabel.text = tableData[indexPath.row].valueForKey("MS_Title") as? String
        cell.notiDateLabel.text = tableData[indexPath.row].valueForKey("CreationDate") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("ShowNotification", sender: self)
        
        self.selectedTableData.MS_Title = tableData[indexPath.row].valueForKey("MS_Title") as?String
        self.selectedTableData.MS_Body = tableData[indexPath.row].valueForKey("MS_Body") as?String
        
        self.showNotification.tableData = self.selectedTableData
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "ShowNotification") {
            
            self.showNotification = segue.destinationViewController as! ShowNotificationViewController
        }
    }
}
