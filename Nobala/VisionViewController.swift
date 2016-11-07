//
//  VisionViewController.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 11/7/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import ASProgressHud

class VisionViewController: UIViewController, ViewWebServiceProtocol {
    
    @IBOutlet weak var visionTitleLabel: UILabel!
    @IBOutlet weak var visionTextArea: UITextView!
    
    var clientObject: NobalaClient?
    var pageArray = [MainPages]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clientObject = NobalaClient.sharedInstance()
        self.clientObject?.webServiceProtocol = self

        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .Default)
        
        let url = NobalaClient.Constants.BaseURL + NobalaClient.Methods.getMainPages
        
        NobalaClient.sharedInstance().getMainPages(url) { (success, error) in
            
        }
    }

    func onReceiveNews(news: [News]) {
        
    }
    
    func onReceiveEvents(news: [Event]) {
        
    }
    
    func onReceiveMainPages(mainPages: [MainPages]) {
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.pageArray = mainPages
            
            self.visionTitleLabel.text = self.pageArray[1].Title
            self.visionTextArea.text = self.pageArray[1].Description
            
            ASProgressHud.hideHUDForView(self.view, animated: true)
        })
    }
    
    func onGetAccessToken(users: [Users]) {
        
    }
    
    func onGetCurrentExams(exams: [Exams]) {
        
    }
    
    func onGetCurrentHomeWork(homework: [HomeWork]) {
        
    }
    
    func onGetHomeWorkStudentReport(report: [HomeWorkStudentReport]) {
        
    }
    
    func onExamsTeacherFollowUp(examsTeacherFollowUp: [ExamsTeacherFollowUp]) {
        
    }
    
    func onFieldLogin() {
        
    }

}
