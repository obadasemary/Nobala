//
//  ViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, ViewWebServiceProtocol {
    
    var url = NobalaClient.Constants.BaseURL
    var viewClientObject: NobalaClient?
    var newsArray = [News]()
    var eventsArray = [Event]()
    var mainPagesArray = [MainPages]()
    
    func onReceiveNews(news: [News]) {
        self.newsArray = news
    }
    
    func onReceiveEvents(events: [Event]) {
        self.eventsArray = events
    }
    
    func onReceiveMainPages(mainPages: [MainPages]) {
        
        self.mainPagesArray = mainPages
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Nobala School")
        viewClientObject = NobalaClient.sharedInstance()
        viewClientObject?.webServiceProtocol = self

    }
    
    @IBAction func btn10News(sender: AnyObject) {
        
        NobalaClient.sharedInstance().get10News((url + NobalaClient.Methods.get10News)) { (success, error) in
            
            print("btn10News")
        }
    }
    
    @IBAction func btnTop5Events(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getTop5Events((url + NobalaClient.Methods.getTop5Events)) { (success, error) in
            
            print("btnTop5Events")
        }
    }
    
    @IBAction func btnMainPages(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getMainPages((url + NobalaClient.Methods.getMainPages)) { (success, error) in
            
            print("btnMainPages")
        }
    }
    
    @IBAction func btnContacntInfo(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getContactInfo((url + NobalaClient.Methods.getContactInfo)) { (success, error) in
            
            print("btnContacntInfo")
        }
    }
    
    @IBAction func btnAdminAndRegister(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getAdmissionsAndRegistrationo((url + NobalaClient.Methods.getAdmissionsAndRegistrationo)) { (success, error) in
            
            print("btnAdminAndRegister")
        }
    }
    
    @IBAction func btnAdvertisment(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getAdvertisment((url + NobalaClient.Methods.getAdvertisment)) { (success, error) in
            
            print("btnAdvertisment")
        }
    }
    
    @IBAction func btnMonthEvents(sender: AnyObject) {
        
        
        NobalaClient.sharedInstance().getMonthEvents(url + NobalaClient.Methods.getMonthEvents, dateString: "02/2016") { (success, error) in
            
            print("btnMonthEvents")
        }
    }

    @IBAction func btnGetAccessToken(sender: AnyObject) {

        NobalaClient.sharedInstance().getAccessToken("111111111", password: "123") { (success, error) in
            
            print("btnGetAccessToken")
        }
    }
    
    @IBAction func btnGetCurrentHomeWork(sender: AnyObject) {
        
//        let user: Users = Users()
//        
//        print(user.accessToken)
        
        NobalaClient.sharedInstance().getCurrentHomeWork(NobalaClient.Token.accessToken) { (success, error) in
            
            print("btnGetCurrentHomeWork")
        }
    }
    
    @IBAction func btnGetCurrentExams(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getCurrentExams(NobalaClient.Token.accessToken) { (success, error) in
            
            print("btnGetCurrentExams")
        }
    }
    
}

