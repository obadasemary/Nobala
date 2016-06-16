//
//  EventsViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import CalendarView
import SwiftMoment

class EventsViewController: UIViewController, CalendarViewDelegate, ViewWebServiceProtocol {
    
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var date: UILabel!
    
    var clientObject: NobalaClient?
    var eventsArray = [Event]()
    
    func onReceiveNews(news: [News]) {
        
    }
    func onReceiveEvents(events: [Event]) {
        self.eventsArray = events
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let logo = UIImage(named: "eventsTitle.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        

        self.clientObject = NobalaClient.sharedInstance()
        self.clientObject?.newsProtocol = self
        
        let calendar = CalendarView()
        calendar.frame = calendarView.frame
        calendar.delegate = self
        CalendarView.dayTextColor = UIColor.grayColor()
        view.addSubview(calendar)
    }
    
    @IBAction func goToHome(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    func calendarDidSelectDate(date: Moment)
    {
        self.date.text = date.format("MMMM d, yyyy")
    }
    
    func calendarDidPageToDate(date: Moment)
    {
        
        self.date.text = date.format("MMMM d, yyyy")
    }
}
