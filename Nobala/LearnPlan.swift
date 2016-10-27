//
//  LearnPlan.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/27/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class LearnPlan {
    
    var fileFullPath: String = ""
    
//    var CreationDate: String = ""
//    var IsArchived: String = ""
    
    var ID: Int = 0
    
//    var UserID: String = ""

    var MaterialID: Int = 0
    
//    var AcadmicYearID: String = ""
//    var SubOrganizationID: String = ""
    
//    var GradeID: String = ""
//    var LevelID: String = ""
    
    var SemsterID: Int = 0
    
    var Title: String = ""
    var Detailes: String = ""
    var File_Name: String = ""
    
    var SemsterNameEn: String = ""
    var SemsterNameAr: String = ""

//    var MaterialNameEn: String = ""
    
    var MaterialNameAr: String = ""
    
    init() {
        
        self.fileFullPath = ""
        self.ID = 0
        self.MaterialID = 0
        self.SemsterID = 0
        self.Title = ""
        self.Detailes = ""
        self.File_Name = ""
        
        self.SemsterNameEn = ""
        self.SemsterNameAr = ""
        
        self.MaterialNameAr = ""
    }
}