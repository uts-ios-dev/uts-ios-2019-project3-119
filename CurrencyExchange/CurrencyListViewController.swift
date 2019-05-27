//
//  CurrencyListViewController.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/16.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import CoreLocation

typealias CurrencySelectedBlock = (_ currency:Currency) -> ()
var countrys:[String:String] = [
                "中国":"CNY",
                "澳大利亚":"AUD",
                "美国":"USD",
                "香港":"HKD",
                "欧盟":"Euro",
                "新西兰":"NZD",
                "日本":"JPY",
                "加拿大":"CAD",
                "新加坡":"SGD",
                "英国":"GBP",

]
class CurrencyListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {
    @IBOutlet weak var tableView: UITableView!
    var selectedBlock:CurrencySelectedBlock?
    var dataArray:[Currency] = [Currency]()
    var locationManager:CLLocationManager = CLLocationManager()
    var localCountry:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Currency"
        self.initData()
        self.tableView.tableFooterView = UIView()
        self.tableView.register(CurrencyListTableViewCell.self, forCellReuseIdentifier: "CurrencyListTableViewCell")
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let geocoder: CLGeocoder = CLGeocoder()
        let currLocation = locations.last
        
        geocoder.reverseGeocodeLocation(currLocation!, preferredLocale: nil) { (placemark:[CLPlacemark]?, error) in
            if (error == nil) {//转换成功，解析获取到的各个信息
                let mark = placemark?.last
                let country: String = mark?.addressDictionary!["Country"]! as! String
                self.localCountry = countrys[country]!
                self.tableView.reloadData()
                print("%@",country)
                self.locationManager.stopUpdatingLocation()
            }
        }
    }
    
    func initData() -> Void {
        let currency1 = Currency.createCurrency(name: "AUD", image: "australia", fullName: "Australian Dollar")
        let currency2 = Currency.createCurrency(name: "USD", image: "united-states-of-america", fullName: "American Dollar")
        let currency3 = Currency.createCurrency(name: "CNY", image: "china", fullName: "chiness Yuan")
        let currency4 = Currency.createCurrency(name: "HKD", image: "hong-kong", fullName: "Hong Kong Dollar")
        let currency5 = Currency.createCurrency(name: "EUR", image: "european-union", fullName: "Euro")
        let currency6 = Currency.createCurrency(name: "NZD", image: "new-zealand", fullName: "New Zealand Dollar")
        let currency7 = Currency.createCurrency(name: "JPY", image: "japan", fullName: "Japanese Dollar")
        let currency8 = Currency.createCurrency(name: "CAD", image: "canada", fullName: "Canadian Dollar")
        let currency9 = Currency.createCurrency(name: "SGD", image: "singapore", fullName: "Singapore Dollar")
        let currency10 = Currency.createCurrency(name: "GBP", image: "united-kingdom", fullName: "British Dollar")

        self.dataArray.append(currency1)
        self.dataArray.append(currency2)
        self.dataArray.append(currency3)
        self.dataArray.append(currency4)
        self.dataArray.append(currency5)
        self.dataArray.append(currency6)
        self.dataArray.append(currency7)
        self.dataArray.append(currency8)
        self.dataArray.append(currency9)
        self.dataArray.append(currency10)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyListTableViewCell", for: indexPath) as! CurrencyListTableViewCell
        cell.currency = self.dataArray[indexPath.row]
        cell.isLocality = cell.currency.name == self.localCountry
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currency = self.dataArray[indexPath.row]
        print(currency.name!)
        if (self.selectedBlock != nil) {
            self.selectedBlock!(currency)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
