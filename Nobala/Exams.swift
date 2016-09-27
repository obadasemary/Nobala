//
//  Exams.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 9/27/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class Exams {
    
    var ExamScheduleID: Int = 0
    var FK_ExamID: Int = 0
    var FK_UserID: Int = 0
    var FK_TrialTypeID: Int = 0
    var FK_AcademicYearID: Int = 0
    
    var ScheduleName: String = ""
    var ScheduleTopic: String = ""
    var ScheduleStartDate: String = ""
    var ScheduleEndDate: String = ""
    var ResultPublicationDate: String = ""
    var CreationDate: String = ""

    var ScheduleDuration: Int = 0
    var FeedBackMode: Int = 0
    var SchedulePassword: String = ""
    
    var IsArchived: Bool = false
    var IsLateAllowed: Bool = false
    
    var FK_ExamPeriodID: Int = 0
    var MinimumTimeBeforeCloseExam: Int = 0
    var TargetStudents: Int = 0
    var FK_SubOrganizationsID: Int = 0
    var FK_GradeID: Int = 0
    
    var IsAttendantSelect: Bool = false
    
    var ExamAttendanceID: Int = 0
    var FK_SectionID: Int = 0
    
    var TeacheNameAr: String = ""
    var TeacheNameEn: String = ""
    var ExamsInstructions: String = ""
    
    var ExamTypeID: Int = 0
    
    init() {
        
        self.ExamScheduleID = 0
        self.FK_ExamID = 0
        self.FK_UserID = 0
        self.FK_TrialTypeID = 0
        self.FK_AcademicYearID = 0
        
        self.ScheduleName = ""
        self.ScheduleTopic = ""
        self.ScheduleStartDate = ""
        self.ScheduleEndDate = ""
        self.ResultPublicationDate = ""
        self.CreationDate = ""
        
        self.ScheduleDuration = 0
        self.FeedBackMode = 0
        self.SchedulePassword = ""
        
        self.IsArchived = false
        self.IsLateAllowed = false
        
        self.FK_ExamPeriodID = 0
        self.MinimumTimeBeforeCloseExam = 0
        self.TargetStudents = 0
        self.FK_SubOrganizationsID = 0
        self.FK_GradeID = 0
        
        self.IsAttendantSelect = false
        
        self.ExamAttendanceID = 0
        self.FK_SectionID = 0
        
        self.TeacheNameAr = ""
        self.TeacheNameEn = ""
        
        self.ExamTypeID = 0
    }
}