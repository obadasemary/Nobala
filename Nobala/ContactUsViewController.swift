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
        self.sideMenu!.delegate = self
    }

    @IBAction func goToHome(sender: AnyObject) {
        
        print("goToHome")
//        self.dismissViewControllerAnimated(true, completion: nil)
//        self.navigationController?.popViewControllerAnimated(true)
//        self.navigationController?.popToViewController(NobalaViewController, animated: true)
        
//        self.navigationController?.popToViewController(NobalaViewController, animated: true)
        
//        let switchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController


//        let switchViewController = self.navigationController?.viewControllers[1] as! NobalaViewController
        
//        self.navigationController?.popToViewController(switchViewController, animated: true)
        
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
