//
//  NobalaViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/17/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import KeychainAccess


class NobalaViewController: UIViewController,ViewWebServiceProtocol {
    
    @IBOutlet weak var LogBtn: UIButton!
    var url = NobalaClient.Constants.BaseURL
    
    var clientObject: NobalaClient?
    var eventsArray = [Event]()
    var dates = [NSDate]()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clientObject = NobalaClient.sharedInstance()
        self.clientObject?.webServiceProtocol = self
        
        NobalaClient.sharedInstance().getTop5Events((url + NobalaClient.Methods.getTop5Events))
        {
            (success, error) in
            
            print("btnEvents")
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func showEvents(sender: AnyObject)
    {
        //        NobalaClient.sharedInstance().getTop5Events((url + NobalaClient.Methods.getTop5Events))
        //        {
        //            (success, error) in
        //
        //            print("btnEvents")
        //        }
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        if segue.identifier == "showEventsView"
        {
            let eventView = segue.destinationViewController as? EventsViewController
            eventView?.dates = self.dates
        }
    }
    
    func onReceiveNews(news: [News]) {
        
    }
    
    func onReceiveEvents(events: [Event]) {
        self.eventsArray = events
        
        for event in self.eventsArray {
            
            let eventStartDate = event.startDate.componentsSeparatedByString("T")
            let dateString = eventStartDate[0]
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            print(event.startDate)
            let date = dateFormatter.dateFromString(dateString)! as NSDate
            
            
            dates.append(date)
        }
        
    }
    
    func onReceiveMainPages(mainPages: [MainPages]) {
        
    }
    
    func onGetAccessToken(users: [Users]) {
        
    }
    
    func onGetCurrentExams(exams: [Exams]) {
        
    }
    
    func onGetCurrentHomeWork(homework: [HomeWork]) {
        
    }
    
    func onGetHomeWorkStudentReport(report: [HomeWorkStudentReport]) {
        
    }
    
    func onExamsTeacherFollowUp(examsTeacherFollowUp: [ExamsTeacherFollowUp]) {
        
    }
    
    func onFieldLogin() {
        
    }
    
}
