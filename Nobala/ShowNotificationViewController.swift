//
//  ShowNotificationViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/7/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ShowNotificationViewController: UIViewController {

    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var notificationBodyLabel: UILabel!
    
    var tableData: Notification = Notification()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        notificationTitleLabel.text = tableData.MS_Title
        notificationBodyLabel.text = tableData.MS_Body
        // Do any additional setup after loading the view.
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

}
