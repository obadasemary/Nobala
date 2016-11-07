//
//  MessagesViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/5/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import ASProgressHud
import KeychainAccess

class MessagesViewController: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UIImageView!
    
    @IBOutlet weak var pickerView: UIPickerView!

    var tableData = [Messages]()
    var selectedTableData: Messages = Messages()
    
    var studentData = []
    var selectedStudentData: ListStudents = ListStudents()

    var currentSelectedStudentId: Int?
    
    var showMessage: ShowMessageViewController = ShowMessageViewController()
    
    @IBOutlet weak var tableView: UITableView!
    
    var sideMenu:ENSideMenu?
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        pickerView.hidden = true
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let keychain = Keychain(service: "Noblaa.app")
        
        if let Userauth_token : String = keychain["auth_token"] {
            
            let userTypeID = keychain["user_type"]
            
            userName.text = keychain["userFName"]
            
            if keychain["user_type"]! == "1" {
                userType.image = UIImage(named: "MLParant.png")
            } else if keychain["user_type"]! == "2" {
                userType.image = UIImage(named: "MLStudend.png")
            } else {
                userType.image = UIImage(named: "MLTeacher.png")
            }
            
            let uType = Int(userTypeID!)
            
            if (uType == 1) {
                
                ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
                
                pickerView.hidden = false
                
//                if currentSelectedStudentId == nil { return }
                
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
                    
                    self.pickerView.reloadAllComponents()
                    
                    let x = String(self.currentSelectedStudentId)
                    
                    self.fetchData(Userauth_token, uID: x)
                    
                    
                    }, fail: { (error, errorMessage) in
                        
                        let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                })
                
            } else {
                
                fetchData(Userauth_token, uID: "null")
            }
        }
    }
    
    func fetchData(Userauth_token: String, uID: String) {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        NobalaClient.sharedInstance().getNewMessagesByUserID(Userauth_token, UserID: uID, completionHandler: { (success, errorMessage, myResult) in
            
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell", forIndexPath: indexPath) as! MessageTableViewCell
        
        cell.MessageTitleLabel.text = tableData[indexPath.row].Subject
        
        cell.contentView.viewWithTag(11)!.backgroundColor = Float(indexPath.row) % 2.0 == 0 ? UIColor(red:0.94, green:0.95, blue:0.95, alpha:1.0) : UIColor(red:0.98, green:0.95, blue:0.99, alpha:1.0)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("ShowMessage", sender: self)
        
        self.selectedTableData.Subject = tableData[indexPath.row].Subject
        self.selectedTableData.BodyText = tableData[indexPath.row].BodyText
        self.selectedTableData.MainMessageID = tableData[indexPath.row].MainMessageID
        self.selectedTableData.UserID = tableData[indexPath.row].UserID
        
        self.showMessage.tableData = self.selectedTableData
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "ShowMessage") {
            
            self.showMessage = segue.destinationViewController as! ShowMessageViewController
        }
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
    }
}
