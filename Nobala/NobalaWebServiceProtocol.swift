//
//  NobalaWebServiceProtocol.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 10/5/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

@objc protocol NobalaWebServiceProtocol {
    
    optional func onGetAccessToken(result: NSDictionary)
    optional func onFieldLogin()
}