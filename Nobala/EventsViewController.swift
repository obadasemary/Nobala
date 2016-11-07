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
//import VRGCalendarView
import ENSwiftSideMenu
import CABCalendarView

class EventsViewController: UIViewController, CABCalendarViewDataSource, ViewWebServiceProtocol, ENSideMenuDelegate, CABCalendarViewDelegate {
    
    //    var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var sideMenu:ENSideMenu?
    
    
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var date: UILabel!
    
    var clientObject: NobalaClient?
    var eventsArray = [Event]()
    var dates = [NSDate]()
    let calendar = CABCalendarView()
    
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
        
        
        calendar.frame = self.calendarView.frame
        calendar.delegate = self
        calendar.dataSource = self
        calendar.setSelectedDate(NSDate(), animated: false)
        
        let date = NSDate()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        
        self.date.text = dateFormatter.stringFromDate(date)
        self.view.addSubview(calendar)
        
    }
    
    
    // MARK: -  calender Methods
    
    func calendarView(calendarView: CABCalendarView, didSelectDate date: NSDate) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        
        self.date.text = dateFormatter.stringFromDate(date)
    }
    
    
    func calendarForCalendarView(calendarView: CABCalendarView) -> NSCalendar
    {
        let ca:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        return ca
    }
    
    func startDateForCalendarView(calendarView: CABCalendarView) -> NSDate
    {
        return NSDate(timeIntervalSinceReferenceDate: 2016)
    }
    func endDateForCalendarView(calendarView: CABCalendarView) -> NSDate
    {
        let comps:NSDateComponents = NSDateComponents()
        comps.year = 2020;
        comps.month = 1;
        comps.day = 1;
        return self.calendarForCalendarView(calendar).dateFromComponents(comps)!
    }
    func calendarView(calendarView: CABCalendarView, hasEventAtDate date: NSDate) -> Bool {
        
        let ca = self.calendarForCalendarView(self.calendar)
        var value = false
        for eventDate in self.dates
        {
            value =  ca.isDate(date, inSameDayAsDate: eventDate)
            if value == true {
                return value
            }
            
        }
        return value
    }
    override func viewWillAppear(animated: Bool) {
        
        NSThread.sleepForTimeInterval(0.05)
        
        let leftView = storyboard?.instantiateViewControllerWithIdentifier("LeftMenuController")
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: leftView!, menuPosition: .Left)
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        //        sideMenu?.menuWidth = screenWidth - 100
        sideMenu?.menuWidth = screenWidth * 0.75
        
        self.sideMenu!.delegate = self
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
