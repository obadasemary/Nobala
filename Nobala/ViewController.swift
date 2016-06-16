//
//  ViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewWebServiceProtocol {
    
    var url = NobalaClient.Constants.BaseURL
    var viewClientObject: NobalaClient?
    var newsArray = [News]()
    var eventsArray = [Event]()
    func onReceiveNews(news: [News])
    {

        
        self.newsArray = news
    }
    func onReceiveEvents(events: [Event])
    {
        self.eventsArray = events
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Nobala School")
        viewClientObject = NobalaClient.sharedInstance()
        viewClientObject?.newsProtocol = self

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
}

