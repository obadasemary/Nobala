//
//  ContactUsViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/17/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SafariServices
import ASProgressHud

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let logo = UIImage(named: "callUs.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }

    @IBAction func goToHome(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func phoneAction(sender: AnyObject) {
    }
    
    @IBAction func mobileAction(sender: AnyObject) {
    }
    
    @IBAction func faxAction(sender: AnyObject) {
    }
    
    @IBAction func eMailAction(sender: AnyObject) {
    }
    
    @IBAction func mapAction(sender: AnyObject) {
    }
    
}
