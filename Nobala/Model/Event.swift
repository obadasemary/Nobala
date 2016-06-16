//
//  Event.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/16/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class Event
{
    var id : Int = 0
    var title : String = ""
    var description : String = ""
    var details : String = ""
    var photo : String = ""
    var photoText : String = ""
    var createdDate : String = ""
    var startDate : String = ""
    var startDateH : String = ""
    var endDate : String = ""
    var endDateH : String = ""
    var createdBy : Int = 0
    var createdIP : String = ""
    var typeId : Int = 0
    var parentId : Int = 0
    var langId : Int = 0
    var orderId : Int = 0
    var isUserItem : Bool
    var isdeleted : Bool
    var printCount : Int = 0
    var viewCount : Int = 0
    var titleEn : String = ""
    var descriptionEn : String = ""
    var detailsEn : String = ""
    
    
    init()
    {
        self.id = 0
        self.title = ""
        self.description = ""
        self.details = ""
        self.photo  = ""
        self.photoText  = ""
        self.createdDate  = ""
        self.startDate  = ""
        self.startDateH  = ""
        self.endDate  = ""
        self.endDateH  = ""
        self.createdBy  = 0
        self.createdIP = ""
        self.typeId  = 0
        self.parentId = 0
        self.langId = 0
        self.orderId = 0
        self.isUserItem = true
        self.isdeleted = true
        self.printCount = 0
        self.viewCount = 0
        self.titleEn = ""
        self.descriptionEn  = ""
        self.detailsEn = ""
    }
}