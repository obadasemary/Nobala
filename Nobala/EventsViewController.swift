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
class EventsViewController: UIViewController, ViewWebServiceProtocol, VRGCalendarViewDelegate {
    
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
    func calendarView(calendarView: VRGCalendarView!, switchedToMonth month: Int32, targetHeight: Float, animated: Bool) {
        
    }
    func calendarView(calendarView: VRGCalendarView!, dateSelected date: NSDate!)
    {
        
    }
    @IBAction func goToHome(sender: AnyObject)
    {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
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
