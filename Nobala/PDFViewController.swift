//
//  PDFViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/27/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var learnPlan: LearnPlan = LearnPlan()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let URL = "http://registeration.nobala.edu.sa/\(learnPlanArray[indexPath.row].valueForKey("fileFullPath") as? String)"
        
        let fileFullPath = self.learnPlan.fileFullPath

        let url : NSURL! = NSURL(string: "http://registeration.nobala.edu.sa/\(fileFullPath)")
        
        webView.loadRequest(NSURLRequest(URL: url))
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
