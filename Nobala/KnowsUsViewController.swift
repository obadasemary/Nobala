//
//  KnowsUsViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/17/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
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
        self.sideMenu!.delegate = self
    }

    @IBAction func goToHome(sender: AnyObject) {
        
//        self.dismissViewControllerAnimated(true, completion: nil)
//        self.navigationController?.popViewControllerAnimated(true)
        
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
}
