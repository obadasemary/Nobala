//
//  SocialViewController.swift
//  Nobala
//
//  Created by Administrator on 6/29/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SafariServices
import ASProgressHud

class SocialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let logo = UIImage(named: "Social.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
