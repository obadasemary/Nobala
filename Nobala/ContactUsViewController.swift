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
import ENSwiftSideMenu

class ContactUsViewController: UIViewController, ENSideMenuDelegate {
    
    // MARK: - SideMenu
//    var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var sideMenu:ENSideMenu?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let logo = UIImage(named: "callUs.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    override func viewWillAppear(animated: Bool)
    {
        NSThread.sleepForTimeInterval(0.05)
        
        let leftView = storyboard?.instantiateViewControllerWithIdentifier("LeftMenuController") as! leftViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: leftView, menuPosition: .Left)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        //        sideMenu?.menuWidth = screenWidth - 100
        sideMenu?.menuWidth = screenWidth * 0.75
        
        self.sideMenu!.delegate = self
    }

    @IBAction func goToHome(sender: AnyObject) {
        
        print("goToHome")
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    // MARK: - SideMenuButton
    func sideMenuWillOpen() {
        print("ContactUsSideMenuWillOpen")
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

    
    @IBAction func phoneAction(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "الهاتف", message: "الرقم الموحد لمجمع البنين 920009659", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func mobileAction(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "الجوال", message: "الابتدائى ورياض الاطفال 0114215712-0112966610 المتسوط والثانوى بنات 0114212095-0114201168", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func faxAction(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "الفاكس", message: "الفاكس 0114210102", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func eMailAction(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "البريد الاكتروني", message: "info@nobala.edu.sa", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func mapAction(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "العنوان", message: "العنوان الرياض - حى الشفا", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
