//
//  leftViewController.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/25/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class leftViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Present new view controller
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
//        var destViewController : UIViewController
//        switch () {
//        case 0:
//            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("KnowsUsStory")
//            break
//        case 1:
//            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ViewController2")
//            break
//        case 2:
//            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ViewController3")
//            break
//        default:
//            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ViewController4")
//            break
//        }
//        sideMenuController()?.setContentViewController(destViewController)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
