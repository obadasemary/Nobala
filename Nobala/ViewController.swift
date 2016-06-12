//
//  ViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var url = NobalaClient.Constants.BaseURL

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Nobala School")
        

    }
    @IBAction func btnOne(sender: AnyObject) {
        
        NobalaClient.sharedInstance().get10News((url + NobalaClient.Methods.get10News)) { (success, error) in
            
            print(success)
        }
    }
    @IBAction func btnTwo(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getTop5Events((url + NobalaClient.Methods.getTop5Events)) { (success, error) in
            
            print(success)
        }
    }
}

