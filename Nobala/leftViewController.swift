//
//  leftViewController.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/25/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import KeychainAccess

class leftViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func knowsUsBtn(sender: AnyObject) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        
        destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("KnowsUsStory")
        sideMenuController()?.setContentViewController(destViewController)
    }
    
    @IBAction func newsBtn(sender: AnyObject) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        
        destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("NewsStory")
        sideMenuController()?.setContentViewController(destViewController)
    }

    
    @IBAction func eventsBtn(sender: AnyObject) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        
        destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("EventsStory")
        sideMenuController()?.setContentViewController(destViewController)
    }
    
    @IBAction func contactUsBtn(sender: AnyObject) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        
        destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ContactUsStory")
        sideMenuController()?.setContentViewController(destViewController)
    }
    
    @IBAction func socialBtn(sender: AnyObject) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        
        destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SocialStory")
        sideMenuController()?.setContentViewController(destViewController)
    }

    @IBAction func loginBtnSlid(sender: AnyObject) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        
        
        let keychain = Keychain(service: "Noblaa.app")
        if let Userauth_token : String = keychain["auth_token"] {
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("managerMainMenu")
            
            
        } else  {
            
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginStory")
        }
    
        sideMenuController()?.setContentViewController(destViewController)
    }
    
    
    @IBAction func doLogOut(sender: UIButton) {
        let keychain = Keychain(service: "Noblaa.app")
        
        keychain["auth_token"] = nil
        keychain["user_type"] = nil
        keychain["userFName"] = nil
        
        
    }
    
    
    
}
