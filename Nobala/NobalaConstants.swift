//
//  NobalaConstants.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

extension NobalaClient {
    
    // MARK: - Constants
    struct  Constants {
        
        static let BaseURL = "http://api.nobala.edu.sa/api/NobalaMobile/"
    }
    
    // MARK: - URLs
    struct URLs {
        
        static let getAccessToken = "http://api.nobala.edu.sa/Token"
        static let getCurrentHomeWork = "http://api.nobala.edu.sa/api/Exams/GeCurrentHomeWork"
        static let getCurrentExams = "http://api.nobala.edu.sa/api/Exams/GetCurrentExams"
        static let getHomeWorkStudentReport = "http://api.nobala.edu.sa/api/Exams/HomeWorkStudentReport?STARTDATE=" + NobalaClient.DATE.startDate + "&ENDDATE=" + NobalaClient.DATE.endDate
        static let getStudyPlan = "http://api.nobala.edu.sa/api/section/GetStudyPalne"
    }
    
    // MARK: - DATE
    struct DATE {
        
        static let startDate = "1/2/2016"
        static let endDate = "1/2/2016"
    }
    
    // MARK: - ReturnURL
    struct ReturnURL {
        
        static let getCurrentHomeWork = "http://registeration.nobala.edu.sa/ExamTokenRedirect?Token=" + NobalaClient.Token.accessToken + "&ExamID="
        static let getCurrentExams = "http://registeration.nobala.edu.sa/ExamTokenRedirect?Token=" + NobalaClient.Token.accessToken + "&ExamID="
    }
    
    struct Token {
        
        static var accessToken = ""
    }
    
    
    // MARK: - Methods
    struct Methods {
        
        static let get10News = "Get10News"
        static let getTop5Events = "GetTop5Events"
        static let getMainPages = "GetMainPages"
        static let getContactInfo = "GetContactInfo"
        static let getAdmissionsAndRegistrationo = "GetAdmissionsAndRegistrationo"
        static let getAdvertisment = "GetAdvertisment"
        static let getMonthEvents = "GetMonthEvents"
    }

    // MARK: - URL Values
    struct  URLValues {
        
        
    }

    // MARK: - JSON Response Keys
    struct JSONResponseKeys {
        
        
    }
    
    // MARK: - JSON Response Values
    struct JSONResponseValues {
        
        static let Fail = "fail"
        static let Ok = "ok"
    }
}