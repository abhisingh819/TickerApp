//
//  CurrencyViewModel.swift
//  tickerApp
//
//  Created by Abhinav Singh on 12/1/18.
//  Copyright © 2018 Abhinav. All rights reserved.
//

import Foundation

class CurrencyViewModel {
    
    var currency:[Currency] = []
    
    func getCurrencyFromAPI(_ completionHandler:@escaping (Bool) -> Void){
        
        let api = APICurrency()
        api.getCurrency(nil) {[weak self](data:AnyObject?,error:NSError?) in
            
            guard let weakSelf = self else { return }
            
            if error == nil {
                if let jsonData = data as? [String:AnyObject] {
                    if let variation = jsonData["stats"] as? [String:AnyObject] {
                        if let group = variation["inr"] as? [String:AnyObject] {
                            
                            for (_,value) in group {
                                if let val = value as? [String: AnyObject] {
                                    let currency = Currency.mapJSONToModel(json: val)
                                    weakSelf.currency.append(currency)
                                }
                            }
                            
                            
                        }
                        
                    }
                    
                    completionHandler(true)
                }
                
            }else {
                completionHandler(false)
            }
        }
    }
    
    func convertStringIntoDictionary(text: String) -> [String:AnyObject]? {
        
        if let data = text.data(using: .utf8) {
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options : []) as? [String:AnyObject]
                {
                    return jsonObject
                } else {
                    print("bad json")
                }
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}
