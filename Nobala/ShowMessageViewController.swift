//
//  ShowMessageViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/6/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ShowMessageViewController: UIViewController {

    @IBOutlet weak var messageTitleLabel: UILabel!
    @IBOutlet weak var messageBodyLabel: UILabel!
    
    var tableData: Messages = Messages()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageTitleLabel.text = tableData.Subject
        messageBodyLabel.text = tableData.BodyText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func replyButton(sender: AnyObject) {
        
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
