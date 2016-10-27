//
//  LearningPlanViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/21/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import ASProgressHud
import KeychainAccess

class LearningPlanViewController: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UIImageView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var semsterID: String? = "1"
    var pickerDataSource = ["الفصل الدراسي الأول", "الفصل الدراسي الثاني"];
    
    @IBOutlet weak var learnPlanTableView: UITableView!
    
    var learnPlanArray = []
    var selectedLearnPlan: LearnPlan = LearnPlan()
    var pdf: PDFViewController = PDFViewController()

    var sideMenu:ENSideMenu?
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let keychain = Keychain(service: "Noblaa.app")
        
        if let Userauth_token : String = keychain["auth_token"] {
            
            let userTypeID = keychain["user_type"]
            
            NobalaClient.sharedInstance().getLearnPlan(Userauth_token, SemsterID: semsterID!, UserTypeID: userTypeID!, completionHandler: { (success, errorMessage, myResult) in
                
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
                
                self.learnPlanArray = myResult
                
                ASProgressHud.hideHUDForView(self.view, animated: true)
                
                self.learnPlanTableView.reloadData()
                
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(row == 0) {
            
            self.semsterID = "1"
            
        } else {
            
            self.semsterID = "2"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.learnPlanArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let tableViewCell = self.learnPlanTableView.dequeueReusableCellWithIdentifier("LearnPlanCell", forIndexPath: indexPath) as! LearningPlanTableViewCell
        
        tableViewCell.learnPlanTitel.text = learnPlanArray[row].valueForKey("MaterialNameAr") as? String
//        tableViewCell.ExamText.text = learnPlanArray[row].valueForKey("ScheduleEndDate") as? String
//        tableViewCell.ExamDegree.text = String((learnPlanArray[row].valueForKey("ExamSheetScore") as? Int)!)
        
        tableViewCell.contentView.viewWithTag(11)!.backgroundColor = Float(indexPath.row) % 2.0 == 0 ? UIColor(red:0.94, green:0.95, blue:0.95, alpha:1.0) : UIColor(red:1.00, green:0.94, blue:0.89, alpha:1.0)
        
//        let URL = "http://registeration.nobala.edu.sa/\(learnPlanArray[indexPath.row].valueForKey("fileFullPath") as? String)"
        
        return tableViewCell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showLearnPlan", sender: self)
        
//        self.selectedLearnPlan.fileFullPath = learnPlanArray[indexPath.row] as! LearnPlan
        
        self.selectedLearnPlan.fileFullPath = (learnPlanArray[indexPath.row].valueForKey("fileFullPath") as? String)!
        self.pdf.learnPlan = self.selectedLearnPlan
        
//        let URL = "http://registeration.nobala.edu.sa/\(learnPlanArray[indexPath.row].valueForKey("fileFullPath") as? String)"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showLearnPlan") {
            
            self.pdf = segue.destinationViewController as! PDFViewController
        }
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
