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
    
    
    @IBAction func twitterAction(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) { 
            
            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
            
            if let url = NSURL(string: "http://blog.algorithmers.com/git/") {
                
                let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                self.presentViewController(safariController, animated: true, completion: nil)
            }
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }
    }
    
    @IBAction func youtubeAction(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
            
            if let url = NSURL(string: "http://www.hongkiat.com/blog/50-freelance-job-sites-for-designers-programmers-best-of/") {
                
                let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                self.presentViewController(safariController, animated: true, completion: nil)
            }
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }
    }
    
    @IBAction func facebookAction(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
            if let url = NSURL(string: "https://www.linkedin.com/pulse/hack-zurich-2016-abdelrahman-el-semary?trk=pulse_spock-articles") {
                
                let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                self.presentViewController(safariController, animated: true, completion: nil)
            }
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }
    }
    
    @IBAction func googlePlusAction(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
            if let url = NSURL(string: "https://www.linkedin.com/pulse/cocoapods-abdelrahman-el-semary?trk=pulse_spock-articles") {
                
                let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                self.presentViewController(safariController, animated: true, completion: nil)
            }
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }
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
