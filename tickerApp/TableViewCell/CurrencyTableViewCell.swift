//
//  CurrencyTableViewCell.swift
//  tickerApp
//
//  Created by Abhinav Singh on 12/1/18.
//  Copyright © 2018 Abhinav. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCurrencyName: UILabel!
    @IBOutlet weak var lblHighestBid: UILabel!
    @IBOutlet weak var lblLowestAsk: UILabel!
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblMax: UILabel!
    @IBOutlet weak var lblVolume: UILabel!
    @IBOutlet weak var lblPerChange: UILabel!
    @IBOutlet weak var lblTradeVolume: UILabel!
    
}

extension CurrencyTableViewCell {
    
    func configureCell(currency: Currency)
    {
        if let fullForm = currency.currency_full_form, let shortForm = currency.currency_short_form {
            lblCurrencyName.isHidden = false
            lblCurrencyName.text = "\(shortForm)(\(fullForm))"
        } else {
            lblCurrencyName.isHidden = true
        }
        
        if let highBid = currency.highest_bid {
            lblHighestBid.isHidden = false
            lblHighestBid.text = "Highest Bid: Rs. \(highBid)"
        } else {
            lblHighestBid.isHidden = true
        }
        
        if let lowAsk = currency.lowest_ask {
            lblLowestAsk.isHidden = false
            lblLowestAsk.text = "Lowest Ask: Rs. \(lowAsk)"
        } else {
            lblLowestAsk.isHidden = true
        }
        
        if let min = currency.min_24hrs {
            lblMin.isHidden = false
            lblMin.text = "Min(24 Hrs): Rs. \(min)"
        } else {
            lblMin.isHidden = true
        }
        
        if let max = currency.max_24hrs {
            lblMax.isHidden = false
            lblMax.text = "Max(24 Hrs): Rs. \(max)"
        } else {
            lblMax.isHidden = true
        }
        
        if let volume = currency.vol_24hrs {
            lblVolume.isHidden = false
            lblVolume.text = "Volume(24 Hrs): \(volume)"
        } else {
            lblVolume.isHidden = true
        }
        
        if let perChange = currency.per_change {
            lblPerChange.isHidden = false
            lblPerChange.text = "Per Change: \(perChange)"
        } else {
            lblPerChange.isHidden = true
        }
        
        if let trade = currency.trade_volume {
            lblTradeVolume.isHidden = false
            lblTradeVolume.text = "Trade Volume: \(trade)"
        } else {
            lblTradeVolume.isHidden = true
        }
        
        
    }
    
}
