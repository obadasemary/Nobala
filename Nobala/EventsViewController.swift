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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let calendar = CalendarView()
        calendar.frame = calendarView.frame
        calendar.delegate = self
        CalendarView.dayTextColor = UIColor.grayColor()
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
