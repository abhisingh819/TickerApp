//
//  ViewController.swift
//  tickerApp
//
//  Created by Abhinav Singh on 12/1/18.
//  Copyright © 2018 Abhinav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblViewCurrency: UITableView!
    let currencyViewModel = CurrencyViewModel()
    var currency = [Currency]()
    var selectedIndexPathSection = [String:Int]()
    var selectedCurrencyAndVariation = [String:String]()
    let socketManager = SocketManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Currency"
        getData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        callAPI()
    }
    
    func callAPI(){
        currencyViewModel.getCurrencyFromAPI(){[weak self](success:Bool) in
            if success{
                guard let weakSelf = self else {
                    return
                }
                weakSelf.currency = []
                weakSelf.currency.append (contentsOf:weakSelf.currencyViewModel.currency)
                DispatchQueue.main.async {
                    weakSelf.tblViewCurrency.reloadData()
                    weakSelf.socketManager.controller = self
                    weakSelf.socketManager.sendMessage()
                }
            }
        }
    }
    
    func parseCurrencyValue(text: String) {
        
        guard let jsonData = currencyViewModel.convertStringIntoDictionary(text: text), let variation = jsonData["data"] as? String, let jsonData1 = currencyViewModel.convertStringIntoDictionary(text: variation), let data = jsonData1["message"] as? [String:AnyObject], let group = data["data"] as? [String:AnyObject] else {
            return
        }
        
        for (_,value) in group {
            if let val = value as? [String: AnyObject] {
                let curr = Currency.mapJSONToModel(json: val)
                if let row = currency.index(where: {$0.currency_short_form == curr.currency_short_form}) {
                    currency[row] = curr
                }
            }
        }
        self.tblViewCurrency.reloadData()
    }
    
    func showAlert(message:String,title:String) {
        let objAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let objAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:
        {Void in
            
            
        })
        
        
        objAlertController.addAction(objAction)
        present(objAlertController, animated: true, completion: nil)
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currencyCell:CurrencyTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as? CurrencyTableViewCell
        
        if let cell = currencyCell {
            cell.configureCell(currency: currency[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

