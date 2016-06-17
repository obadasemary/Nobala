//
//  NobalaClient.swift
//  Nobala
//
//  Created by Abdelrahman Mohamed on 6/12/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import UIKit

class NobalaClient: NSObject {
    
    var session: NSURLSession
    var webServiceProtocol:ViewWebServiceProtocol?
    
    override init() {
        session = NSURLSession.sharedSession()
        super.init()
    }
    
//    func addObserver(observer: ViewWebServiceProtocol?)
//    {
//        observer.
//        for i in 1...observersArray.count
//        {
//           if(observersArray[i].)
//        }
//    }
    
    func taskForGETMethod(urlString: String, completionHandler: (result: AnyObject!, error: NSError?) -> Void) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            guard (error == nil) else {
                print(error)
                completionHandler(result: nil, error: error)
                return
            }
            
            self.parseJSONWithCompletionHandler(data!, completionHandler: completionHandler)
        }
        task.resume()
    }
    
    func parseJSONWithCompletionHandler(data: NSData, completionHandler: (result: AnyObject!, error: NSError?) -> Void) {
        
        var parsingError : NSError?
        var parsedResult: AnyObject?
        
        do {
            parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        } catch let error as NSError {
            parsingError = error
            parsedResult = nil
            print("Parse error - \(parsingError?.localizedDescription)")
            return
        }
        
        if let error = parsingError {
            completionHandler(result: nil, error: error)
        } else {
            completionHandler(result: parsedResult, error: nil)
        }
    }
    
    class func sharedInstance() -> NobalaClient {
        
        struct Singleton {
            static var sharedInstance = NobalaClient()
        }
        
        return Singleton.sharedInstance
    }
}
