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
        
        taskForGETMethod(urlString) { (result, error) in
            
            guard (error == nil) else {
                completionHandler(success: false, error: error)
                return
            }
            
            if let mainPages = result as? NSArray {
                
                for mainPage in mainPages {
                    
                    let Id = mainPage["Id"] as! Int
                    let Title = mainPage["Title"] as! String
                    let Description = mainPage["Description"] as! String
                    let Details = mainPage["Details"] as! String
                    let Photo = mainPage["Photo"] as! String
                    let OrderId = mainPage["OrderId"] as! Int
                    let Isdeleted = mainPage["Isdeleted"] as! Bool
                    let CreatedDate = mainPage["CreatedDate"] as! String
                    let UpdateDate = mainPage["UpdateDate"] as? String
                    let UpdatedBy = mainPage["UpdatedBy"] as? Int
                    let ViewCount = mainPage["ViewCount"] as! Int
                    let PrintCount = mainPage["PrintCount"] as! Int
                    let CreatedBy = mainPage["CreatedBy"] as! Int
                    let TitleEn = mainPage["TitleEn"] as! String
                    let DescriptionEn = mainPage["DescriptionEn"] as! String
                    let DetailsEn = mainPage["DetailsEn"] as! String
                    let ShcoolID = mainPage["ShcoolID"] as! Int
                    let ShowTextImage = mainPage["ShowTextImage"] as! Int
                    
                    print(Id)
                    print(Title)
                    print(Description)
                    print(Details)
                    print(CreatedDate)
                    print(UpdateDate)
                }
                
                completionHandler(success: true, error: nil)
            }
        }
    }
    
    //MARK: - GetContactInfo
    
    func getContactInfo(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        taskForGETMethod(urlString) { (result, error) in
            
            guard (error == nil) else {
                completionHandler(success: false, error: error)
                return
            }
            
            if let contactInfo = result as? NSArray {
                
                for contact in contactInfo {
                    
                    let Id = contact["Id"] as! Int
                    let Phone1 = contact["Phone1"] as! String
                    let Phone2 = contact["Phone2"] as! String
                    let Phone3 = contact["Phone3"] as! String
                    let Mobile1 = contact["Mobile1"] as! String
                    let Mobile2 = contact["Mobile2"] as! String
                    let Mobile3 = contact["Mobile3"] as! String
                    let Address1 = contact["Address1"] as! String
                    let Address2 = contact["Address2"] as! String
                    let Address3 = contact["Address3"] as! String
                    let POBOX1 = contact["POBOX1"] as! String
                    let POBOX2 = contact["POBOX2"] as! String
                    let POBOX3 = contact["POBOX3"] as! String
                    let Email1 = contact["Email1"] as! String
                    let Email2 = contact["Email2"] as! String
                    let Email3 = contact["Email3"] as! String
                    let Website = contact["Website"] as! String
                    let LastUpdateDate = contact["LastUpdateDate"] as! String
                    let Photo = contact["Photo"] as! String
                    let Details = contact["Details"] as! String
                    let Fax1 = contact["Fax1"] as! String
                    let Fax2 = contact["Fax2"] as! String
                    let Fax3 = contact["Fax3"] as! String
                    let LangId = contact["LangId"] as! Int
                    
                    print(Id)
                    print(Phone1)
                    print(Phone2)
                    print(Phone3)
                    print(Mobile1)
                    print(Mobile2)
                    print(Mobile3)
                    print(Address1)
                    print(Address2)
                    print(Address3)
                    print(POBOX1)
                    print(POBOX2)
                    print(POBOX3)
                    print(Email1)
                    print(Email2)
                    print(Email3)
                    print(Website)
                    print(LastUpdateDate)
                    print(Photo)
                    print(Details)
                    print(Fax1)
                    print(Fax2)
                    print(Fax3)
                    print(LangId)
                }
                
                completionHandler(success: true, error: nil)
            }
        }
    }
    
    //MARK: - GetAdmissionsAndRegistrationo
    
    func getAdmissionsAndRegistrationo(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        taskForGETMethod(urlString) { (result, error) in
            
            guard (error == nil) else {
                completionHandler(success: false, error: error)
                return
            }
            
            if let adminAndRegister = result as? NSArray {
                
                for admin in adminAndRegister {
                    
                    let Id = admin["Id"] as! Int
                    let Title = admin["Title"] as! String
                    let Description = admin["Description"] as! String
                    let Details = admin["Details"] as! String
                    let Photo = admin["Photo"] as! String
                    let OrderId = admin["OrderId"] as! Int
                    let Isdeleted = admin["Isdeleted"] as! Bool
                    let CreatedDate = admin["CreatedDate"] as! String
                    let UpdateDate = admin["UpdateDate"] as? String
                    let UpdatedBy = admin["UpdatedBy"] as? Int
                    let ViewCount = admin["ViewCount"] as! Int
                    let PrintCount = admin["PrintCount"] as! Int
                    let CreatedBy = admin["CreatedBy"] as! Int
                    let TitleEn = admin["TitleEn"] as! String
                    let DescriptionEn = admin["DescriptionEn"] as! String
                    let DetailsEn = admin["DetailsEn"] as! String
                    let ShcoolID = admin["ShcoolID"] as! Int
                    let ShowTextImage = admin["ShowTextImage"] as! Int
                    
                    print(Id)
                    print(Title)
                    print(Description)
                    print(Details)
                    print(CreatedDate)
                    print(UpdateDate)
                }
                
                completionHandler(success: true, error: nil)
            }
        }
    }
    
    //MARK: - GetAdvertisment
    
    func getAdvertisment(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        taskForGETMethod(urlString) { (result, error) in
            
            guard (error == nil) else {
                completionHandler(success: false, error: error)
                return
            }
            
            if let advertisment = result as? NSArray {
                
                for advertis in advertisment {
                    
                    let AdvertismentID = advertis["AdvertismentID"] as! Int
                    let AdvertismentPlaceID = advertis["AdvertismentPlaceID"] as! Int
                    let Title = advertis["Title"] as! String
                    let Description = advertis["Description"] as! String
                    let StartDate = advertis["StartDate"] as! String
                    let EndDate = advertis["EndDate"] as! String
                    let Url = advertis["Url"] as! String
                    let FileExtension = advertis["FileExtension"] as! String
                    let IsActive = advertis["IsActive"] as! Bool
                    let DateAdded = advertis["DateAdded"] as! String
                    
                    print(AdvertismentID)
                    print(AdvertismentPlaceID)
                    print(Title)
                    print(Description)
                    print(StartDate)
                    print(EndDate)
                    print(Url)
                    print(FileExtension)
                    print(IsActive)
                    print(DateAdded)
                }
                
                completionHandler(success: true, error: nil)
            }
        }
    }
}