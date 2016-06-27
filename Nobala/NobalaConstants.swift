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