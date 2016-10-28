//
//  DailyHomeworkViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/21/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import ASProgressHud
import KeychainAccess

class DailyHomeworkViewController: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource, SetTimeViewControllerDelegate {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UIImageView!
    
    @IBOutlet weak var DailyWorkTableView: UITableView!
    
    var todayDate: NSDate?
    var todayDateStr: String?
    @IBOutlet weak var todyDateLabel: UILabel!
    
    var DailyWorkArray = []

    var sideMenu:ENSideMenu?
    
    var window: UIWindow?
    var setTimeVC: SetTimeViewController?
    
    let keychain = Keychain(service: "Noblaa.app")
    
    var usertypeID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sideMenuController()?.sideMenu?.delegate = self
        
        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        userName.text = keychain["userFName"]
        usertypeID = keychain["userTypeID"]
        
        if keychain["user_type"]! == "1" {
            userType.image = UIImage(named: "MLParant.png")
        } else if keychain["user_type"]! == "2" {
            userType.image = UIImage(named: "MLStudend.png")
        } else {
            userType.image = UIImage(named: "MLTeacher.png")
        }
    }
    
    func fetchDailyWork() {
        
        // Do NOT call webservice if either of dates has no value
        if nil == todayDateStr {return}
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        if let Userauth_token : String = keychain["auth_token"] {
            
            NobalaClient.sharedInstance().getHomeWorkLogger(Userauth_token, todayDate: todayDateStr!, UserID: "", UserTypeID: usertypeID!, completionHandler: { (success, errorMessage, myResult) in
                
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
                
                self.DailyWorkArray = myResult
                
                ASProgressHud.hideHUDForView(self.view, animated: true)
                
                self.DailyWorkTableView.reloadData()
                
                }, fail: { (error, errorMessage) in
                    
                    let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
            })
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
        print("DailyHomeworkViewControllerSideMenuWillOpen")
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
    
    @IBAction func goToHome(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.DailyWorkArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let tableViewCell = self.DailyWorkTableView.dequeueReusableCellWithIdentifier("DailyWorkCell", forIndexPath: indexPath) as! DailyWorkTableViewCell
        
        tableViewCell.DailyTitle.text = DailyWorkArray[row].valueForKey("MaterialNameAr") as? String
        tableViewCell.DailyDate.text = todyDateLabel.text
        tableViewCell.DailyTextArea.text = DailyWorkArray[row].valueForKey("Detailes") as? String
        tableViewCell.DailyTextAreaTitle.text = DailyWorkArray[row].valueForKey("Title") as? String
        
        return tableViewCell
    }

    @IBAction func chooseTime(sender: UIButton) {
        
        setTimeVC = SetTimeViewController(nibName: "SetTimeView", bundle: NSBundle.mainBundle())
        if sender.tag == 13 {
            setTimeVC?.type = .To
        }
        setTimeVC!.containerController = self
        
        // Create the dialog
        let popup = PopupDialog(viewController: setTimeVC!, transitionStyle: .BounceDown, buttonAlignment: .Horizontal, gestureDismissal: true)
        
        setTimeVC!.dialog = popup
        
        // Present dialog
        self.presentViewController(popup, animated: true, completion: nil)
    }
    
    func updateChosenTimes(date: NSDate, type: ChooseTimeViewType) {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = NSLocale(localeIdentifier: "ar")
        
        todayDate = date
        todyDateLabel.text = formatter.stringFromDate(date)
        
        formatter.locale = NSLocale(localeIdentifier: "en")
        formatter.dateFormat = "dd/MM/yyyy"
        todayDateStr = formatter.stringFromDate(date)
    }
    
    func refreshPresentedData() {
        fetchDailyWork()
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
