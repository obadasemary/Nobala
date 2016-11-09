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

class DailyHomeworkViewController: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource, SetTimeViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UIImageView!
    
    @IBOutlet weak var chosePickerView: UIPickerView!
    @IBOutlet weak var viewPickerView: UIView!
    @IBOutlet weak var actionButton: UIButton!
    
    var studentData = []
    var currentSelectedStudentId: Int?
    var token: String?
    var usersType: String?

    @IBOutlet weak var dateView: UIView!

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

        self.chosePickerView.dataSource = self
        self.chosePickerView.delegate = self
        
        actionButton.hidden = true
        chosePickerView.hidden = true
        viewPickerView.hidden = true
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        if let Userauth_token : String = keychain["auth_token"] {
            
            token = Userauth_token
            
            userName.text = keychain["userFName"]
            
            if keychain["user_type"]! == "1" {
                userType.image = UIImage(named: "MLParant.png")
            } else if keychain["user_type"]! == "2" {
                userType.image = UIImage(named: "MLStudend.png")
            } else {
                userType.image = UIImage(named: "MLTeacher.png")
            }
            
            let userTypeID = keychain["user_type"]
            usertypeID = userTypeID
            
            let uType = Int(userTypeID!)
            
            if (uType == 1) {
                
                actionButton.hidden = false
                dateView.hidden = true
            }
        }
    }
    
    func fetchDataUponChosenChild (Userauth_token: String) {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        NobalaClient.sharedInstance().getlistStudentsByParentID(Userauth_token, completionHandler: { (success, errorMessage,myResult) in
            
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
            
            self.studentData = myResult
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
            
            self.chosePickerView.reloadAllComponents()
            
            }, fail: { (error, errorMessage) in
                
                let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
        })
        
    }
    
    func fetchData(Userauth_token: String, uID: String) {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        NobalaClient.sharedInstance().getHomeWorkLogger(Userauth_token, todayDate: todayDateStr!, UserID: uID, UserTypeID: usertypeID!, completionHandler: { (success, errorMessage, myResult) in
            
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
    
    func fetchDailyWork() {
        
        // Do NOT call webservice if either of dates has no value
        if nil == todayDateStr {return}
        
        if let Userauth_token : String = keychain["auth_token"] {
            
            token = Userauth_token
            
            let userTypeID = keychain["user_type"]
            
            usersType = userTypeID
            
            let uType = Int(userTypeID!)
            
            if (uType == 1) {
                
                let x = String(self.currentSelectedStudentId)
                print(x)
                
                self.fetchData(Userauth_token, uID: x)
                
            } else {
                
                fetchData(token!, uID: "null")
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return studentData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return studentData[row].valueForKey("FullNameAr") as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        currentSelectedStudentId = studentData[row].valueForKey("PK_UserID") as? Int
        print(currentSelectedStudentId)
        
        self.chosePickerView.hidden = true
        viewPickerView.hidden = true
        
        dateView.hidden = false
        
        fetchDataUponChosenChild(token!)
        
    }
    
    @IBAction func ActionButton(sender: AnyObject) {
        
        chosePickerView.hidden = false
        viewPickerView.hidden = false
        
        fetchDataUponChosenChild(token!)
    }
}
