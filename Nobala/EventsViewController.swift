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

class EventsViewController: UIViewController, CalendarViewDelegate {
    
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        let calendar = CalendarView()
        calendar.frame = calendarView.frame
        calendar.delegate = self
//        CalendarView.daySelectedBackgroundColor = UIColor.redColor()
//        CalendarView.daySelectedTextColor = UIColor.whiteColor()
//        CalendarView.todayBackgroundColor = UIColor.redColor()
//        CalendarView.todayTextColor = UIColor.whiteColor()
//        CalendarView.otherMonthBackgroundColor = UIColor.clearColor()
//        CalendarView.otherMonthTextColor = UIColor(white: 1.0, alpha: 0.3)
        CalendarView.dayTextColor = UIColor.grayColor()
//        CalendarView.dayBackgroundColor = UIColor.clearColor()
//        CalendarView.weekLabelTextColor = UIColor(white: 1.0, alpha: 0.3)
        
        
        calendar.delegate = self
        view.addSubview(calendar)
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
