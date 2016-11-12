//
//  ShowExamReportViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ASProgressHud
import KeychainAccess

class ShowExamReportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableData = []
    var showtableData: ExamStudentReport = ExamStudentReport()
    
    var token: String?
    let keychain = Keychain(service: "Noblaa.app")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        if let Userauth_token : String = keychain["auth_token"] {
            
            token = Userauth_token
            
            userName.text = keychain["userFName"]
            
            if keychain["user_type"]! == "3" {
                userType.image = UIImage(named: "MLTeacher.png")
            }
            
            let examScheduleID: String = String(showtableData.ExamScheduleID)
            
            NobalaClient.sharedInstance().getExamsTeacherFollowUp(Userauth_token, ExamScheduleID: examScheduleID, completionHandler: { (success, errorMessage, myResult) in
                
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
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ShowExamReportCell", forIndexPath: indexPath) as! ShowExamReportTableViewCell
        
        cell.ShowExamTitle.text = tableData[indexPath.row].valueForKey("FullNameAr") as? String
        cell.ShowExamText.text = tableData[indexPath.row].valueForKey("ScheduleEndDate") as? String
        
        cell.ShowExamDegree.text = String((tableData[indexPath.row].valueForKey("Score") as? Int)!)
        
        return cell
    }
}
