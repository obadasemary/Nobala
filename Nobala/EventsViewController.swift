//
//  EventsViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
//import CalendarView
//import SwiftMoment
import VRGCalendarView
import ENSwiftSideMenu

class EventsViewController: UIViewController, ViewWebServiceProtocol, VRGCalendarViewDelegate, ENSideMenuDelegate {
    
//    var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var sideMenu:ENSideMenu?

    
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var date: UILabel!
    
    var clientObject: NobalaClient?
    var eventsArray = [Event]()
    
    func onReceiveNews(news: [News]) {
        
    }
    
    func onReceiveEvents(events: [Event]) {
        self.eventsArray = events
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
    
    // MARK: - LifeCycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let logo = UIImage(named: "eventsTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        self.clientObject = NobalaClient.sharedInstance()
        self.clientObject?.webServiceProtocol = self
        
//        let calendar = CalendarView()
//        calendar.frame = calendarView.frame
//        calendar.delegate = self
//        CalendarView.dayTextColor = UIColor.grayColor()
//        view.addSubview(calendar)
      
        let calendar = VRGCalendarView()
        calendar.frame = self.calendarView.frame
        calendar.delegate = self
        self.view.addSubview(calendar)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        NSThread.sleepForTimeInterval(0.05)
        
        let leftView = storyboard?.instantiateViewControllerWithIdentifier("LeftMenuController")
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: leftView!, menuPosition: .Left)
        self.sideMenu?.delegate = self
    }
    
    // MARK: - SideMenuButton
    func sideMenuWillOpen() {
        print("EventsSideMenuWillOpen")
    }
    
    @IBAction func toggle(sender: AnyObject)
    {
        if ((self.sideMenu?.isMenuOpen) == false)
        {
            self.sideMenu?.showSideMenu()
            
        }
        else
        {
            self.sideMenu?.hideSideMenu()
        }
    }

    
    func calendarView(calendarView: VRGCalendarView!, switchedToMonth month: Int32, targetHeight: Float, animated: Bool) {
        
    }
    
    func calendarView(calendarView: VRGCalendarView!, dateSelected date: NSDate!)
    {
        
    }
    
    @IBAction func goToHome(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("NobalaStory") as! NobalaViewController
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    
//    func calendarDidSelectDate(date: Moment)
//    {
//        self.date.text = date.format("MMMM d, yyyy")
//    }
//    
//    func calendarDidPageToDate(date: Moment)
//    {
//        
//        self.date.text = date.format("MMMM d, yyyy")
//    }
}
