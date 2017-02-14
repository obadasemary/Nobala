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
import ENSwiftSideMenu

class SocialViewController: UIViewController, ENSideMenuDelegate {

    // MARK: - SideMenu
//    var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var sideMenu:ENSideMenu?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let logo = UIImage(named: "NewlkobolWlTasgeelUplo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        // Do any additional setup after loading the view.
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
        print("SocialSideMenuWillOpen")
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
