//
//  SchoolFeesViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ASProgressHud

class SchoolFeesViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textArea: UITextView!
    
    var tableData = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        NobalaClient.sharedInstance().getAdmissionsAndRegistrationo({ (success, errorMessage, myResult) in
            
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
            
            self.titleLabel.text = self.tableData[1].valueForKey("Title") as? String
            self.textArea.text = self.tableData[1].valueForKey("Description") as? String
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
            
            
        }) { (error, errorMessage) in
            
            let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}
