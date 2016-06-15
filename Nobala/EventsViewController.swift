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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let calendar = CalendarView(frame: CGRectMake(0, 200, CGRectGetWidth(view.frame), 320))
        
//        CalendarView.daySelectedBackgroundColor = UIColor
//        CalendarView.daySelectedTextColor = UIColor.whiteColor()
//        CalendarView.todayBackgroundColor = UIColor(white: 0.0, alpha: 0.3)
//        CalendarView.todayTextColor = UIColor.whiteColor()
//        CalendarView.otherMonthBackgroundColor = UIColor.clearColor()
//        CalendarView.otherMonthTextColor = UIColor(white: 1.0, alpha: 0.3)
//        CalendarView.dayTextColor = UIColor(white: 1.0, alpha: 0.6)
//        CalendarView.dayBackgroundColor = UIColor.clearColor()
//        CalendarView.weekLabelTextColor = UIColor(white: 1.0, alpha: 0.3)

        
        view.addSubview(calendar)
    }
    
    func calendarDidSelectDate(date: Moment) {
        title = date.format("MMMM d, yyyy")
    }
    
    func calendarDidPageToDate(date: Moment) {
        
        title = date.format("MMMM d, yyyy")
    }
}
