//
//  ViewWebServiceProtocol.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

protocol ViewWebServiceProtocol {
    
    func onReceiveNews(news: [News])
    func onReceiveEvents(events: [Event])
    func onReceiveMainPages(mainPages: [MainPages])
    func onGetAccessToken(users: [Users])
    func onFieldLogin()
    func onGetCurrentHomeWork(homework: [HomeWork])
    func onGetCurrentExams(exams: [Exams])
    func onGetHomeWorkStudentReport(report: [HomeWorkStudentReport])
    func onExamsTeacherFollowUp(examsTeacherFollowUp: [ExamsTeacherFollowUp])
    
}
