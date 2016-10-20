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

        // Admin: 111111111
        // Parent: 1000000000
        // Student: 1100000000
        // Teacher: 2000000000
        
//        NobalaClient.sharedInstance().getAccessToken("1000000000", password: "123") { (success, error) in
//            
//            print("btnGetAccessToken")
//        }
        
        NobalaClient.sharedInstance().getAccessToken("111111111", password: "123", completionHandler: { (success, errorMessage, user) in
            
            print("btnGetAccessToken")
            }) { (error, errorMessage) in
                
                print(error)
        }
    }
    
    @IBAction func btnGetCurrentHomeWork(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getCurrentHomeWork(NobalaClient.Token.accessToken, completionHandler: { (success, errorMessage, myHomeWork) in
            
            print("btnGetCurrentHomeWork")
            }) { (error, errorMessage) in
                
                print("Error")
        }
    }
    
    @IBAction func btnGetCurrentExams(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getCurrentExams( NobalaClient.Token.accessToken) { (success, error) in
            
            print("btnGetCurrentExams")
        }
    }
    
    
    @IBAction func btnGetHomeWorkStudentReport(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getHomeWorkStudentReport( NobalaClient.Token.accessToken) { (success, error) in
            
            print("btnGetHomeWorkStudentReport")
        }
    }
    
    @IBAction func btnGetExamsTeacherFollowUp(sender: AnyObject) {
        
        NobalaClient.sharedInstance().getExamsTeacherFollowUp( NobalaClient.Token.accessToken) { (success, error) in
            
            print("btnGetExamsTeacherFollowUp")
        }
    }
}