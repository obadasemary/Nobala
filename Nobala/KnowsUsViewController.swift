//
//  KnowsUsViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/17/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SafariServices
import ASProgressHud
import ENSwiftSideMenu

class KnowsUsViewController: UIViewController, ENSideMenuDelegate {
    
    // MARK: - SideMenu
//    var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)    
    var sideMenu:ENSideMenu?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "knowsUsTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    override func viewWillAppear(animated: Bool)
    {
        NSThread.sleepForTimeInterval(0.05)
        
        let leftView = storyboard?.instantiateViewControllerWithIdentifier("LeftMenuController") as!leftViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: leftView, menuPosition: .Left)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        //        sideMenu?.menuWidth = screenWidth - 100
        sideMenu?.menuWidth = screenWidth * 0.75
        
        self.sideMenu!.delegate = self
    }

    @IBAction func goToHome(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    // MARK: - SideMenuButton
    func sideMenuWillOpen() {
        print("KnowsUsSideMenuWillOpen")
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
    
    @IBAction func whoAreWeTouched(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
            
            if let url = NSURL(string: "https://noor.moe.gov.sa/noor/login.aspx") {
                
                let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                self.presentViewController(safariController, animated: true, completion: nil)
            }
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }
    }
    
    @IBAction func photoAlbumTouched(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
            
            if let url = NSURL(string: "http://nobala.edu.sa/Gallery.aspx?SchoolID=1000&archived=0") {
                
                let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                self.presentViewController(safariController, animated: true, completion: nil)
            }
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }
    }
    
    @IBAction func nobalaInYourHandTouched(sender: AnyObject) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
            
            if let url = NSURL(string: "http://nobala.edu.sa/panorama/index.html") {
                
                let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                self.presentViewController(safariController, animated: true, completion: nil)
            }
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }
    }
}
