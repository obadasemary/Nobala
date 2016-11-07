//
//  NobalaConvenient.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

extension NobalaClient {
    
    //MARK: - get10News
    func get10News(urlString: String, completionHandler: (success: Bool, error: NSError?) -> Void)
    {
        
        taskForGETMethod(urlString)
        {
            (result, error) in
            
            guard (error == nil)
                else
            {
                completionHandler(success: false, error: error)
                return
            }
            
            if let tenNews = result as? NSArray {
                
                var newsArray = [News]()
                
                for news in tenNews {
                    
                    let newsObject:News = News()
                    
                    newsObject._id  = news["Id"] as! Int
                    newsObject._title = news["Title"] as! String
                    newsObject._description = news["Description"] as! String
                    newsObject._details = news["Details"] as! String
                    newsObject._imageUrl = news["ImageUrl"] as! String
                    newsObject._orderId = news["OrderId"] as! Int
                    newsObject._isdeleted = news["Isdeleted"] as! Bool
//                    newsObject._updateDate = news["UpdateDate"] as! String
//                    newsObject._updatedBy = news["UpdatedBy"] as! String
                    newsObject._viewCount = news["ViewCount"] as! Int
                    newsObject._printCount = news["PrintCount"] as! Int
                    newsObject._createdBy = news["CreatedBy"] as! Int
                    newsObject._titleEn = news["TitleEn"] as! String
                    newsObject._descriptionEn = news["DescriptionEn"] as! String
                    newsObject._detailsEn = news["DetailsEn"] as! String
                    newsObject._schoolID = news["ShcoolID"] as! Int
                    
                    newsArray.append(newsObject)
                }
                
                self.webServiceProtocol?.onReceiveNews(newsArray)
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
            
            var eventsArray = [Event]()

            if let top5Events = result as? NSArray {
                
                for topEvent in top5Events {
                    
                    let event : Event = Event()
                    
                    event.id = topEvent["Id"] as! Int
                    event.title = topEvent["Title"] as! String
                    event.description = topEvent["Description"] as! String
                    event.details = topEvent["Details"] as! String
                    event.photo = topEvent["Photo"] as! String
                    event.photoText = topEvent["PhotoText"] as! String
                    event.createdDate = topEvent["CreatedDate"] as! String
                    event.startDate = topEvent["StartDate"] as! String
                    event.startDateH = topEvent["StartDateH"] as! String
                    event.endDate = topEvent["EndDate"] as! String
                    event.endDateH = topEvent["EndDateH"] as! String
                    event.createdBy = (topEvent["CreatedBy"] as! Int)
                    event.createdIP = topEvent["CreatedIP"] as! String
                    event.typeId = topEvent["TypeId"] as! Int
                    event.parentId = topEvent["ParentId"] as! Int
                    event.langId = topEvent["LangId"] as! Int
                    event.orderId = topEvent["OrderId"] as! Int
                    event.isUserItem = topEvent["IsUserItem"] as! Bool
                    event.isdeleted = topEvent["Isdeleted"] as! Bool
                    event.printCount = topEvent["PrintCount"] as! Int
                    event.viewCount = topEvent["ViewCount"] as! Int
                    event.titleEn = topEvent["TitleEn"] as! String
                    event.descriptionEn = topEvent["DescriptionEn"] as! String
                    event.detailsEn = topEvent["DetailsEn"] as! String
                    
                    eventsArray.append(event)
                   
                }
                
                self.webServiceProtocol?.onReceiveEvents(eventsArray)
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
            
            var mainPagesArray = [MainPages]()
            
            if let mainPages = result as? NSArray {
                
                for mainPage in mainPages {
                    
                    let main: MainPages = MainPages()
                    
                    main.Id = mainPage["Id"] as! Int
                    main.Title = mainPage["Title"] as! String
                    main.Description = mainPage["Description"] as! String
//                    main.Details = mainPage["Details"] as! String
//                    main.Photo = mainPage["Photo"] as! String
//                    main.OrderId = mainPage["OrderId"] as! Int
//                    main.Isdeleted = mainPage["Isdeleted"] as! Bool
//                    main.CreatedDate = mainPage["CreatedDate"] as! String
////                    main.UpdateDate = (mainPage["UpdateDate"] as? String)!
//                    main.UpdatedBy = (mainPage["UpdatedBy"] as? Int)!
//                    main.ViewCount = mainPage["ViewCount"] as! Int
//                    main.PrintCount = mainPage["PrintCount"] as! Int
//                    main.CreatedBy = mainPage["CreatedBy"] as! Int
//                    main.TitleEn = mainPage["TitleEn"] as! String
//                    main.DescriptionEn = mainPage["DescriptionEn"] as! String
//                    main.DetailsEn = mainPage["DetailsEn"] as! String
//                    main.ShcoolID = mainPage["ShcoolID"] as! Int
//                    main.ShowTextImage = mainPage["ShowTextImage"] as! Int
                    
                    mainPagesArray.append(main)
                }
                
                self.webServiceProtocol?.onReceiveMainPages(mainPagesArray)
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
    
    // MARK: - GetMonthEvents
    
    func getMonthEvents(urlString: String, dateString: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        let url = urlString + "/" + dateString
        
        taskForGETMethod(url) { (result, error) in
            
            guard (error == nil) else {
                completionHandler(success: false, error: error)
                return
            }
            
            if let monthEvents = result as? NSArray {
                
                for monthEvent in monthEvents {
                    
                    let Title = monthEvent["Title"] as! String
                    
                    print(Title)
                }
                
                completionHandler(success: true, error: nil)
            }
        }
    }
    
    // MARK: - GetAccessToken
    
    func getAccessToken(username: String, password: String, completionHandler: (success: Bool, errorMessage: String?, user: Users?) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let parameters = ["grant_type": "password",
                          "username": username,
                          "password": password,
                          "client_id": "obada"]
        
        
        Alamofire.request(.POST, NobalaClient.URLs.getAccessToken, parameters: parameters)
            .responseJSON {   response in
                
                if let error = response.result.error {
                    
                    fail(error: error, errorMessage: nil)
                    
                    return
                }

                guard let result = response.result.value else {
                    
                    fail(error: response.result.error, errorMessage: nil)
                    
                    return
                }
                
                if let error = result["error"] as? String {
                    
                    completionHandler(success: false, errorMessage: error, user:nil)

                    return
                }
                
                let user: Users = Users()
                
                user.accessToken = result["access_token"] as! String
                
                NobalaClient.Token.accessToken = user.accessToken
                print("NobalaClient.Token \(NobalaClient.Token.accessToken)")
                
                user.tokenType = result["token_type"] as! String
                user.expiresIn = result["expires_in"] as! Int
                user.refreshToken = result["refresh_token"] as! String
                user.asClientId = result["as:client_id"] as! String
                user.userName = result["userName"] as! String
                user.userTypeID = result["userTypeID"] as! String
                user.userFullName = result["userFullName"] as! String
                user.issued = result[".issued"] as! String
                user.expires = result[".expires"] as! String
                
                
                print(user.accessToken)
                print(user.tokenType)
                print(user.expiresIn)
                print(user.refreshToken)
                print(user.asClientId)
                print(user.userName)
                print(user.userTypeID)
                print(user.userFullName)
                print(user.issued)
                print(user.expires)

                completionHandler(success: true, errorMessage: nil, user:user)

            }
    }
    
    // MARK: - GetCurrentHomeWork
    
    func getCurrentHomeWork(accessToken: String, completionHandler: (success: Bool, errorMessage: String?, myHomeWork: NSArray) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        Alamofire.request(.POST, NobalaClient.URLs.getCurrentHomeWork, headers: headers).responseJSON { (response) in
            
            var work: NSArray = []
           
            if let result = response.result.value {
                
                if let homeWorks = result as? NSArray {
                    work = homeWorks
                }
            }
            completionHandler(success: true, errorMessage: nil, myHomeWork:work)
        }
    }
    
    // MARK: - GetCurrentExams
    
    func getCurrentExams(accessToken: String, completionHandler: (success: Bool, errorMessage: String?, myExams: NSArray) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        Alamofire.request(.POST, NobalaClient.URLs.getCurrentExams, headers: headers).responseJSON { (response) in
            
            var newArray: NSArray = []
            
            if let result = response.result.value {
                
                if let exams = result as? NSArray {
                    
                    newArray = exams
                }
            }
            
            completionHandler(success: true, errorMessage: nil, myExams: newArray)
        }
    }
    
    // MARK: - HomeWorkStudentReport
    
    func getHomeWorkStudentReport(accessToken: String, startDate: String, endDate: String, completionHandler: (success: Bool, errorMessage: String?, myResult: NSArray) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        let getHomeWorkStudentReport = "http://api.nobala.edu.sa/api/Exams/HomeWorkStudentReport?STARTDATE=" + startDate + "&ENDDATE=" + endDate
        
        Alamofire.request(.POST, getHomeWorkStudentReport, headers: headers).responseJSON { (response) in
            
            var newArray: NSArray = []
            
            if let results = response.result.value {
                
                if let result = results as? NSArray {
                    
                    newArray = result
                }
            }
            
            completionHandler(success: true, errorMessage: nil, myResult: newArray)
        }
    }
    
    // MARK: - ExamsStudentReport
    
    func getExamsStudentReport(accessToken: String, startDate: String, endDate: String, completionHandler: (success: Bool, errorMessage: String?, myResult: NSArray) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        let getExamsStudentReport = "http://api.nobala.edu.sa/api/Exams/ExamsStudentReport?STARTDATE=" + startDate + "&ENDDATE=" + endDate
        
        Alamofire.request(.POST, getExamsStudentReport, headers: headers).responseJSON { (response) in
            
            var newArray: NSArray = []
            
            if let results = response.result.value {
                
                if let result = results as? NSArray {
                    
                    newArray = result
                }
            }
            
            completionHandler(success: true, errorMessage: nil, myResult: newArray)
        }
    }
    
    // MARK: - GetStudyPlan
    
    func getLearnPlan(accessToken: String, SemsterID: String, UserTypeID: String, completionHandler: (success: Bool, errorMessage: String?, myResult: NSArray) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        let parameters: [String: AnyObject] = [

            "UserTypeID": UserTypeID,
            "SemsterID": SemsterID,
            "index": "0",
            "limit": "10"
        ]
        
        Alamofire.request(.POST, NobalaClient.URLs.getStudyPlan, parameters: parameters, encoding: .JSON, headers: headers).responseJSON { (response) in
            
            var newArray: NSArray = []
            
            if let results = response.result.value {
                
                if let result = results as? NSArray {
                    
                    newArray = result
                }
            }
            
            completionHandler(success: true, errorMessage: nil, myResult: newArray)
        }
    }
    
    // MARK: - GetHomeWorkLogger
    
    func getHomeWorkLogger(accessToken: String, todayDate: String, UserID: String, UserTypeID: String, completionHandler: (success: Bool, errorMessage: String?, myResult: NSArray) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        let parameters: [String: AnyObject] = [
            
            "UserTypeID": UserTypeID,
            "UserID": "5479",
            "Date": todayDate
        ]
        
        Alamofire.request(.POST, NobalaClient.URLs.getHomeWorkLogger, parameters: parameters, encoding: .JSON, headers: headers).responseJSON { (response) in
            
            var newArray: NSArray = []
            
            if let results = response.result.value {
                
                if let result = results as? NSArray {
                    
                    newArray = result
                }
            }
            
            completionHandler(success: true, errorMessage: nil, myResult: newArray)
        }
    }
    
    // MARK: - ExamsTeacherFollowUp
    
    func getExamsTeacherFollowUp(accessToken: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        Alamofire.request(.POST, NobalaClient.URLs.getExamsTeacherFollowUp, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { (response) in
            
            if let result = response.result.value {
                
                if let resultArray = result as? NSArray {
                    
                    var newArray = [ExamsTeacherFollowUp]()
                    
                    for resultObj in resultArray {
                        
                        let examsTeacherFollowUp: ExamsTeacherFollowUp = ExamsTeacherFollowUp()
                        
                        examsTeacherFollowUp.FullNameAr = resultObj["FullNameAr"] as! String
//                        examsTeacherFollowUp.FullNameEn = resultObj["FullNameEn"] as! String
                        
                        examsTeacherFollowUp.ScheduleName = resultObj["ScheduleName"] as! String
                        examsTeacherFollowUp.ScheduleEndDate = resultObj["ScheduleEndDate"] as! String
                        
                        examsTeacherFollowUp.Score = resultObj["Score"] as! Int
                        examsTeacherFollowUp.ExamTotalScore = resultObj["ExamTotalScore"] as! Int
                        
                        examsTeacherFollowUp.EndDate = resultObj["EndDate"] as! String
                        
                        examsTeacherFollowUp.ElapsedTime = resultObj["ElapsedTime"] as! Int
                        examsTeacherFollowUp.ExamSheetID = resultObj["ExamSheetID"] as! Int
                        examsTeacherFollowUp.StudentActualDuration = resultObj["StudentActualDuration"] as! Int
                        
                        print(examsTeacherFollowUp.FullNameAr)
//                        print(examsTeacherFollowUp.FullNameEn)
                        
                        print(examsTeacherFollowUp.ScheduleName)
                        print(examsTeacherFollowUp.ScheduleEndDate)
                        
                        print(examsTeacherFollowUp.Score)
                        print(examsTeacherFollowUp.ExamTotalScore)
                        
                        print(examsTeacherFollowUp.EndDate)
                        
                        print(examsTeacherFollowUp.ElapsedTime)
                        print(examsTeacherFollowUp.ExamSheetID)
                        print(examsTeacherFollowUp.StudentActualDuration)
                        
                        print("***************************")
                        
                        newArray.append(examsTeacherFollowUp)
                        
                    }
                    
                    self.webServiceProtocol?.onExamsTeacherFollowUp(newArray)
                }
            }
        }
        
        completionHandler(success: true, error: nil)
    }
    
    // MARK: - GetNewMessagesByUserID

    func getNewMessagesByUserID(accessToken: String, UserID: String, completionHandler: (success: Bool, errorMessage: String?, myResult: [Messages]) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        let parameters: [String: AnyObject] = [
            
            "UserID":UserID,
            "pageSize":"20",
            "sorting":"",
            "startIndex":"0"
        ]
        
        Alamofire.request(.POST, NobalaClient.URLs.getNewMessagesByUserID, parameters: parameters, encoding: .JSON, headers: headers).responseJSON { (response) in
            
            var newArray = [Messages]()
            
            if let results = response.result.value {
                
                let json = JSON(results)
                
                let messages = json["Message"].arrayValue
                
                for item in messages {
                    
                    let parsedObject = Messages()
                    
                    let subject = item["Subject"].stringValue
                    let mainMessageID = item["MainMessageID"].intValue
                    let bodyText = item["BodyText"].stringValue
                    let userID = item["UserID"].intValue
                    
                    parsedObject.Subject = subject
                    parsedObject.BodyText = bodyText
                    parsedObject.MainMessageID = mainMessageID
                    parsedObject.UserID = userID            
                    
                    newArray.append(parsedObject)
                }
            }
            
            completionHandler(success: true, errorMessage: nil, myResult: newArray)
        }
    }
    
    // MARK: - GetNotification
    
    func getNotification(accessToken: String, completionHandler: (success: Bool, errorMessage: String?, myResult: NSArray) -> Void, fail: (error: NSError?, errorMessage: String?) -> Void) {
        
        let headers = ["Authorization": "Bearer " + accessToken]
        
        Alamofire.request(.POST, NobalaClient.URLs.getNotification, encoding: .JSON, headers: headers).responseJSON { (response) in
            
            var newArray: NSArray = []
            
            if let results = response.result.value {
                
                if let result = results as? NSArray {
                    
                    newArray = result
                }
            }
            
            completionHandler(success: true, errorMessage: nil, myResult: newArray)
        }
    }
}