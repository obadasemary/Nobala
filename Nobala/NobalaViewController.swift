//
//  NobalaViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/17/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class NobalaViewController: UIViewController {

    var url = NobalaClient.Constants.BaseURL

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func newsButtonClicked(sender: AnyObject)
    {
        NobalaClient.sharedInstance().get10News((url + NobalaClient.Methods.get10News))
        {
            (success, error) in
            
            print("btn10News")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
}
