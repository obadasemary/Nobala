//
//  Users.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 9/5/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class Users {
    
    var accessToken: String = ""
    var tokenType: String = ""
    var expiresIn: Int = 0
    var refreshToken: String = ""
    var asClientId: String = ""
    var userName: String = ""
    var userTypeID: String = ""
    var userFullName: String = ""
    var issued: String = ""
    var expires: String = ""
    
    
    init()
    {
        self.accessToken = ""
        self.tokenType = ""
        self.expiresIn = 0
        self.refreshToken = ""
        self.asClientId = ""
        self.userName = ""
        self.userTypeID = ""
        self.userFullName = ""
        self.issued = ""
        self.expires = ""
    }
    
//    "refresh_token": "6beee9491489486780d221ef99f78482",
//    "as:client_id": "obada",
//    "userName": "111111111",
//    "userTypeID": "4",
//    "userFullName": "Admin",
//    ".issued": "Sat, 03 Sep 2016 23:43:39 GMT",
//    ".expires": "Sun, 03 Sep 2017 23:43:39 GMT"
    
//    class func userSharedInstance() -> Users {
//        
//        struct Singleton {
//            static var userSharedInstance = Users()
//        }
//        
//        return Singleton.userSharedInstance
//    }
}
