//
//  ExamStudentReport.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/26/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class ExamStudentReport {
    
    var ExamScheduleID: Int = 0
    var TeacherID: Int = 0
    
    var ScheduleName: String = ""
    var TeacherNameAr: String = ""
    var TeacherNameEn: String = ""
    
    var ScheduleStartDate: String = ""
    var ScheduleEndDate: String = ""
    
    var FinalDegree: Int = 0
    var ExamID: Int = 0
    var ExamSheetScore: Int = 0
    var ExamTypeID: Int = 0
    var isSchFinished: Int = 0
    
    init() {
        
        self.ExamScheduleID = 0
        self.TeacherID = 0
        
        self.ScheduleName = ""
        self.TeacherNameAr = ""
        self.TeacherNameEn = ""
        
        self.ScheduleStartDate = ""
        self.ScheduleEndDate = ""
        
        self.FinalDegree = 0
        self.ExamID = 0
        self.ExamSheetScore = 0
        self.ExamTypeID = 0
        self.isSchFinished = 0
    }
}
