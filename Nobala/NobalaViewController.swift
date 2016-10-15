//
//  NobalaViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/17/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import KeychainAccess


class NobalaViewController: UIViewController {

    @IBOutlet weak var LogBtn: UIButton!
    var url = NobalaClient.Constants.BaseURL

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func newsButtonClicked(sender: AnyObject)
    {
        NobalaClient.sharedInstance().get10News((url + NobalaClient.Methods.get10News))
        {
            (success, error) in
            
            print("btn10News")
        }
    }

    @IBAction func enterManagementArea(sender: UIButton) {
      
        let keychain = Keychain(service: "Noblaa.app")
        if let Userauth_token : String = keychain["auth_token"] {
            performSegueWithIdentifier("enterManagerArea", sender: self)
            
            } else  {
            performSegueWithIdentifier("showLogin", sender: self)
            
            }
       
        
        
    }
    
    
    
    @IBAction func doLogOut(sender: UIButton) {
        let keychain = Keychain(service: "Noblaa.app")
        
        keychain["auth_token"] = nil
        keychain["user_type"] = nil
        keychain["userFName"] = nil
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
}
