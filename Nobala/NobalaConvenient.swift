//
//  NobalaConvenient.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import UIKit

extension NobalaClient {
    
    //get10News
    func get10News(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        taskForGETMethod(urlString) { (result, error) in
            
            guard (error == nil) else {
                completionHandler(success: false, error: error)
                return
            }
        }
    }
    
    //getTop5Events
    func getTop5Events(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
    
    
    }
    
    //getMainPages
    func getMainPages(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        
    }
    
    //getContactInfo
    func getContactInfo(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
    }
    
    //getAdmissionsAndRegistrationo
    func getAdmissionsAndRegistrationo(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        
    }
    
    //getAdvertisment
    func getAdvertisment(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
    }
}