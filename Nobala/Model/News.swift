//
//  News.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//
import Foundation
import UIKit

class News
{
    
    var _id:Int = 0
    var _title : String = ""
    var _description : String = ""
    var _details : String = ""
    var _imageUrl : String = ""
    var _orderId : Int = 0
    var _isdeleted : Bool
    var _createdDate : String = ""
    var _updateDate : String = ""
    var _updatedBy : String = ""
    var _viewCount : Int = 0
    var _printCount : Int = 0
    var _createdBy : Int = 0
    var _titleEn : String = ""
    var _descriptionEn : String = ""
    var _detailsEn : String = ""
    var _schoolID : Int = 0
    var _showTextImage : Int = 0
    
//     init(id:Int, title : String, description:String, details : String, photo:String, orderId:Int,isdeleted:Bool, createdDate:String, updateDate:String, updatedBy : String, viewCount:Int, printCount:Int, createdBy:Int, titleEn:String, descriptionEn:String, detailsEn:String,  schoolID:Int, showTextImage:Int)
//    {
//       self._id = id
//       self._title = title
//        self._description = description
//        self._details = details
//        self._photo = photo
//        self._orderId = orderId
//        self._isdeleted = isdeleted
//        self._createdDate = createdDate
//        self._updateDate = updateDate
//        self._updatedBy = updatedBy
//        self._viewCount = viewCount
//        self._printCount = printCount
//        self._createdBy = createdBy
//        self._titleEn = titleEn
//        self._descriptionEn = descriptionEn
//        self._detailsEn = detailsEn
//        self._schoolID = schoolID
//        self._showTextImage = showTextImage
//    }
    
     init() {
        self._id = 0
        self._title = ""
        self._description = ""
        self._details = ""
        self._imageUrl = ""
        self._orderId = 0
        self._isdeleted = true
        self._createdDate = ""
        self._updateDate = ""
        self._updatedBy = ""
        self._viewCount = 0
        self._printCount = 0
        self._createdBy = 0
        self._titleEn = ""
        self._descriptionEn = ""
        self._detailsEn = ""
        self._schoolID = 0
        self._showTextImage = 0
    }
}
