//
//  ChoseStudentViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/7/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ASProgressHud
import KeychainAccess

class ChoseStudentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var studentData = []
    var selectedStudentData: ListStudents = ListStudents()
    
//    var studentId: Int?
    
    var currentSelectedStudentId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)

        let keychain = Keychain(service: "Noblaa.app")
        
        if let Userauth_token : String = keychain["auth_token"] {
            
            let userTypeID = keychain["user_type"]
            
            if (userTypeID == "1") {
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
                    
    //                print(self.studentData)
    //                print(self.studentData.valueForKey("FullNameAr") as? String)
                    
                    
                    }, fail: { (error, errorMessage) in
                        
                        let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                })
                
                self.pickerView.delegate = self
                self.pickerView.dataSource = self
                
            } else {
                
                return
            }
//            print(currentSelectedStudentId)
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
