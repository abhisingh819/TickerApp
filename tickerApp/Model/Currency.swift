//
//  Currency.swift
//  tickerApp
//
//  Created by Abhinav Singh on 12/1/18.
//  Copyright © 2018 Abhinav. All rights reserved.
//

import UIKit

class Currency: NSObject {
    var highest_bid: String?
    var lowest_ask: String?
    var last_traded_price: String?
    var min_24hrs: String?
    var max_24hrs: String?
    var vol_24hrs: String?
    var currency_full_form: String?
    var currency_short_form: String?
    var per_change: String?
    var trade_volume: String?
    
    static func mapJSONToModel(json:[String:AnyObject]) -> Currency {
        let currency = Currency()
        
        if let highest_bid = json["highest_bid"] as? String {
            currency.highest_bid = highest_bid
        }
        if let lowest_ask = json["lowest_ask"] as? String {
            currency.lowest_ask = lowest_ask
        }
        if let last_traded_price = json["last_traded_price"] as? String {
            currency.last_traded_price = last_traded_price
        }
        if let min_24hrs = json["min_24hrs"] as? String {
            currency.min_24hrs = min_24hrs
        }
        
        if let max_24hrs = json["max_24hrs"] as? String {
            currency.max_24hrs = max_24hrs
        }
        if let vol_24hrs = json["vol_24hrs"] as? String {
            currency.vol_24hrs = vol_24hrs
        }
        if let currency_full_form = json["currency_full_form"] as? String {
            currency.currency_full_form = currency_full_form
        }
        if let currency_short_form = json["currency_short_form"] as? String {
            currency.currency_short_form = currency_short_form
        }
        
        if let per_change = json["per_change"] as? String {
            currency.per_change = per_change
        }
        if let trade_volume = json["trade_volume"] as? String {
            currency.trade_volume = trade_volume
        }
        
        
        return currency
    }
    
}

