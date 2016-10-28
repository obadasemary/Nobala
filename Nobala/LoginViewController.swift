//
//  LoginViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/4/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import KeychainAccess

class LoginViewController: UIViewController, ENSideMenuDelegate, ViewWebServiceProtocol {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
     
    
    var sideMenu:ENSideMenu?

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.hideKeyboardWhenTappedAround()
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
    
    @IBAction func ForgetPasswordBtn(sender: AnyObject) {
        
    }

    @IBAction func LoginButton(sender: AnyObject) {
        
        guard let userName = usernameTextField.text where !userName.isEmpty,
              let password = passwordTextField.text where !password.isEmpty
        
        else {
            
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        NobalaClient.sharedInstance().getAccessToken(userName, password: password, completionHandler: { (success, errorMessage, user) in
        
            if !success {
            
                var message = "Unknown error, please try again"
                
                if errorMessage == "invalid_grant" {
                
                    message = "Pleas Make Sure Username & Password is correct"
                }
                
                let alertController = UIAlertController(title: "Oops", message: message, preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                return
            }
            
            // You have the user
            
            user?.accessToken
            
            //Key Chain Implementation
            let keychain = Keychain(service: "Noblaa.app")

            keychain["auth_token"] = user?.accessToken
            keychain["user_type"] = user?.userTypeID
            keychain["userFName"] = user?.userFullName
            keychain["userTypeID"] = user?.userTypeID

            //End of Key Chain Implementation
     
            
            self.performSegueWithIdentifier("enterManagerArea", sender: self)
            
            
//            let alertController = UIAlertController(title: "Oops", message: user?.accessToken, preferredStyle: .Alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            
//            self.presentViewController(alertController, animated: true, completion: nil)
//            
            
        }) { (error, errorMessage) in
            
            let alertController = UIAlertController(title: "Oops", message: "Connection error, please try again", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - SideMenuButton
    func sideMenuWillOpen() {
        print("SocialSideMenuWillOpen")
    }
    
    @IBAction func toggle(sender: AnyObject)
    {
        if ((self.sideMenu?.isMenuOpen) == false) {
            self.sideMenu?.showSideMenu()
            
        } else {
            self.sideMenu?.hideSideMenu()
        }
    }
    
    @IBAction func goToHome(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    
    func onReceiveNews(news: [News]) {
        
    }
    
    func onReceiveEvents(events: [Event]) {
        
    }
    
    func onReceiveMainPages(mainPages: [MainPages]) {
        
    }
    
    func onGetAccessToken(users: [Users]) {
        
    }
    
    func onGetCurrentExams(exams: [Exams]) {
        
    }
    
    func onGetCurrentHomeWork(homework: [HomeWork]) {
        
    }
    
    func onGetHomeWorkStudentReport(report: [HomeWorkStudentReport]) {
        
    }
    
    func onExamsTeacherFollowUp(examsTeacherFollowUp: [ExamsTeacherFollowUp]) {
        
    }
    
    func onFieldLogin() {
        
        let alertController = UIAlertController(title: "Oops", message: "Pleas Make Sure Username & Password is correct", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
