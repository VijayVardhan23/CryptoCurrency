//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by kalimi venkata vijay vardhan on 31/12/17.
//  Copyright © 2017 kalimi venkata vijay vardhan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

   
    @IBOutlet weak var tableView: UITableView!
    var cryptoCurrencies: [[String: Any]] = [[String: Any]]()
    let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/")
    
        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON{
                (response) in
                if response.result.isSuccess{
                    self.cryptoCurrencies = response.result.value! as! [[String: Any]]
                    self.tableView.reloadData()
                }else{
                    print(response.result.error!)
                }
            }
        }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  cryptoCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCurrency") as! CryptoCurrencyTableViewCell
        cell.symbolImage.image = UIImage(named: "\(indexPath.row)")
        cell.symbolImage.layer.borderWidth = 5
        cell.symbolImage.layer.borderColor = UIColor.gray.cgColor
        let fullForm = cryptoCurrencies[indexPath.row]["name"] as! String
        let abbre = cryptoCurrencies[indexPath.row]["symbol"] as! String
        cell.nameField.text! = "\(abbre)|\(fullForm)"
        cell.usdValueField.text! = (cryptoCurrencies[indexPath.row]["price_usd"] as! String) + "$"
        cell.lastDayField.text! = (cryptoCurrencies[indexPath.row]["percent_change_7d"] as! String) + "%"
        cell.lastWeekField.text! = (cryptoCurrencies[indexPath.row]["percent_change_24h"] as! String) + "%"
        cell.nameField.isUserInteractionEnabled = false
        cell.usdValueField.isUserInteractionEnabled = false
        cell.lastDayField.isUserInteractionEnabled = false
        cell.lastWeekField.isUserInteractionEnabled = false
        cell.lastDay24hrField.isUserInteractionEnabled = false
        cell.lastWeek7dField.isUserInteractionEnabled = false
        return cell
        
    }
    
}

