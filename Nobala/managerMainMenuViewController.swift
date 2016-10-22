//
//  managerMainMenuViewController.swift
//  Nobala
//
//  Created by Ayman Gomaa on 10/13/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import KeychainAccess
  
class managerMainMenuViewController: UIViewController, ENSideMenuDelegate  {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UIImageView!
    
    var sideMenu:ENSideMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "LoginTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        let keychain = Keychain(service: "Noblaa.app")
        userName.text = keychain["userFName"]
        
        if keychain["user_type"]! == "1" {
            userType.image = UIImage(named: "MLParant.png")
        } else if keychain["user_type"]! == "2" {
            userType.image = UIImage(named: "MLStudend.png")
        } else {
            userType.image = UIImage(named: "MLTeacher.png")
        }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - SideMenuButton
    func sideMenuWillOpen() {
        print("Main Manger MenuWillOpen")
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


}
