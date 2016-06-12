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
    
    //MARK: - get10News
    func get10News(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        taskForGETMethod(urlString) { (result, error) in
            
            guard (error == nil) else {
                completionHandler(success: false, error: error)
                return
            }
            
            if let tenNews = result as? NSArray {
                
                for news in tenNews {
                    
                    let id  = news["Id"] as! Int
                    let title = news["Title"] as! String
                    let description = news["Description"] as! String
                    let details = news["Details"] as! String
                    let photo = news["Photo"] as! String
                    let orderId = news["OrderId"] as! Int
                    let isDeleted = news["Isdeleted"] as! Bool
                    let updateDate = news["UpdateDate"] as? String
                    let updatedBy = news["UpdatedBy"] as? String
                    let viewCount = news["ViewCount"] as! Int
                    let printCount = news["PrintCount"] as! Int
                    let createdBy = news["CreatedBy"] as! Int
                    let titleEn = news["TitleEn"] as! String
                    let descriptionEn = news["DescriptionEn"] as! String
                    let detailsEn = news["DetailsEn"] as! String
                    let shcoolID = news["ShcoolID"] as! Int
                    print(id)
                    print(title)
                    print(description)
                    print(details)
                    print(orderId)
                    print(isDeleted)
                    print(shcoolID)
                }
                
                completionHandler(success: true, error: nil)
            }
            
        }
    }
    
    //MARK: - GetTop5Events
    func getTop5Events(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        taskForGETMethod(urlString) { (result, error) in
            
            guard (error == nil) else {
                completionHandler(success: false, error: error)
                return
            }
            
            if let top5Events = result as? NSArray {
                
                for topEvent in top5Events {
                    
                    let Id = topEvent["Id"] as! Int
                    let Title = topEvent["Title"] as! String
                    let Description = topEvent["Description"] as! String
                    let Details = topEvent["Details"] as! String
                    let Photo = topEvent["Photo"] as? String
                    let PhotoText = topEvent["PhotoText"] as? String
                    let CreatedDate = topEvent["CreatedDate"] as! String
                    let StartDate = topEvent["StartDate"] as? String
                    let StartDateH = topEvent["StartDateH"] as? String
                    let EndDate = topEvent["EndDate"] as? String
                    let EndDateH = topEvent["EndDateH"] as? String
                    let CreatedBy = topEvent["CreatedBy"] as? Int
                    let CreatedIP = topEvent["CreatedIP"] as? String
                    let TypeId = topEvent["TypeId"] as? Int
                    let ParentId = topEvent["ParentId"] as? Int
                    let LangId = topEvent["LangId"] as? Int
                    let OrderId = topEvent["OrderId"] as? Int
                    let IsUserItem = topEvent["IsUserItem"] as? Bool
                    let Isdeleted = topEvent["Isdeleted"] as? Bool
                    let PrintCount = topEvent["PrintCount"] as? Int
                    let ViewCount = topEvent["ViewCount"] as? Int
                    let TitleEn = topEvent["TitleEn"] as? String
                    let DescriptionEn = topEvent["DescriptionEn"] as? String
                    let DetailsEn = topEvent["DetailsEn"] as? String
                    
                    
                    print(Id)
                    print(Title)
                    print(Description)
                    print(Details)
                    print(CreatedDate)
                }
                
                completionHandler(success: true, error: nil)
            }
        }
        
    }
    
    //MARK: - GetMainPages
    func getMainPages(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        
    }
    
    //MARK: - GetContactInfo
    func getContactInfo(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
    }
    
    //MARK: - GetAdmissionsAndRegistrationo
    func getAdmissionsAndRegistrationo(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        
    }
    
    //MARK: - GetAdvertisment
    func getAdvertisment(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
    }
}