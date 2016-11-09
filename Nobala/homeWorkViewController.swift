//
//  homeWorkViewController.swift
//  Nobala
//
//  Created by Ayman Gomaa on 10/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//


import UIKit
import ASProgressHud
import ENSwiftSideMenu
import KeychainAccess


class homeWorkViewController: UIViewController, ViewWebServiceProtocol, UITableViewDelegate, UITableViewDataSource, ENSideMenuDelegate, homeWorkTableViewCellDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UIImageView!
    
    @IBOutlet weak var chosePickerView: UIPickerView!
    @IBOutlet weak var viewPickerView: UIView!
    @IBOutlet weak var actionButton: UIButton!
    
    var studentData = []
    var currentSelectedStudentId: Int?
    var token: String?
    var usersType: String?
    
    var sideMenu:ENSideMenu?
    
    var window: UIWindow?
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var clientObject: NobalaClient?
    var hWArray = []
    var selectedhw:HomeWork = HomeWork()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.chosePickerView.dataSource = self
        self.chosePickerView.delegate = self
        
        actionButton.hidden = true
        chosePickerView.hidden = true
        viewPickerView.hidden = true
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
//        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.clientObject = NobalaClient.sharedInstance()
        self.clientObject?.webServiceProtocol = self
        
        let keychain = Keychain(service: "Noblaa.app")
        
        if let Userauth_token : String = keychain["auth_token"] {
            
            token = Userauth_token
            
            let userTypeID = keychain["user_type"]
            
            usersType = userTypeID
            
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
                
                actionButton.hidden = false
                
                
            } else {
                
                fetchData(Userauth_token, uID: "null")
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
            
            let x = String(self.currentSelectedStudentId)
            
            self.fetchData(Userauth_token, uID: x)
            
            
            }, fail: { (error, errorMessage) in
                
                let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
        })
        
    }
    
    func fetchData(Userauth_token: String, uID: String) {
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        NobalaClient.sharedInstance().getCurrentHomeWork(Userauth_token, UserID: uID, completionHandler: { (success, errorMessage, myHomeWork) in
            
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
            
            self.hWArray = myHomeWork
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
            
            self.newsTableView.reloadData()
            
        }) { (error, errorMessage) in
            
            let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
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
    
    @IBAction func goToHome(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hWArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let tableViewCell = self.newsTableView.dequeueReusableCellWithIdentifier("homeWorkCell", forIndexPath: indexPath) as! homeWorkTableViewCell
        
        tableViewCell.NewsTitle.text = hWArray[row].valueForKey("ScheduleName") as? String
        tableViewCell.NewsText.text = hWArray[row].valueForKey("ScheduleEndDate") as? String
        tableViewCell.delegate = self
        
        tableViewCell.contentView.viewWithTag(11)!.backgroundColor = Float(indexPath.row) % 2.0 == 0 ? UIColor(red:0.94, green:0.95, blue:0.95, alpha:1.0) : UIColor(red:0.91, green:1.00, blue:0.98, alpha:1.0)
        
        return tableViewCell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! homeWorkTableViewCell).attachmentImageView.tag = hWArray[indexPath.row].valueForKey("FK_ExamID") as! Int
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let segueID = segue.identifier {
            switch segueID {
            case "ViewHomeWorkWebViewController":
                let dest = segue.destinationViewController as! HomeWorkWebViewController
                if let url = NSURL(string: sender as! String) {
                    dest.url = url
                }
            default:
                break
            }
        }
    }
    
    func onReceiveNews(news: [News])
    {
        
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
    
    //MARK: cell delegation
    func openHomeworkWebView(ID: Int) {
        
        let keychain = Keychain(service: "Noblaa.app")
        
        if let Userauth_token : String = keychain["auth_token"] {
            let selectedHomeWorkURLString = "http://registeration.nobala.edu.sa/ExamTokenRedirect?Token=\(Userauth_token)&ExamID=\(ID)"
            self.performSegueWithIdentifier("ViewHomeWorkWebViewController", sender: selectedHomeWorkURLString)
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
        
        self.chosePickerView.hidden = true
        viewPickerView.hidden = true
        
        fetchDataUponChosenChild(token!)
        
    }
    
    @IBAction func ActionButton(sender: AnyObject) {
        
        chosePickerView.hidden = false
        viewPickerView.hidden = false
        
        fetchDataUponChosenChild(token!)
    }

}







