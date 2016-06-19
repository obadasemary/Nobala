//
//  ViewWebServiceProtocol.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/15/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

protocol ViewWebServiceProtocol {
    
    optional func onReceiveNews(news: [News])
    func onReceiveEvents(events: [Event])
    func onReceiveMainPages(mainPages: [MainPages])
}
