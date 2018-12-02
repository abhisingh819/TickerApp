//
//  APICurrency.swift
//  tickerApp
//
//  Created by Abhinav Singh on 12/1/18.
//  Copyright © 2018 Abhinav. All rights reserved.
//

import Foundation

class APICurrency:NSObject{
    
    /**
     getFacilities
     
     - parameter completionHandler:        (AnyObject response, NSError)
     */
    func getCurrency(_ parameters:[String:AnyObject]?,_ completionHandler:@escaping ((AnyObject?,NSError?)->Void)){
        
        APIHelper.makeRequest(urlString: "https://koinex.in/api/ticker", verb: .GET, parameters: nil, headers: nil,type:"JSON",completionHandler: completionHandler)
        
    }
    
}
