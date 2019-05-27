//
//  linkAPIManager.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/14.
//  Copyright © 2019 apple. All rights reserved.
//
// This is API links

import UIKit
import Alamofire
import SwiftyJSON

let appKey = "42454"
let sign = "bbb7b8ebdcd21e4d385eeda736ee25b5"

//Currency API
class NetworkManager: NSObject {
    class func exchange(scur:String,tcur:String,success:@escaping(_ response:Rate)->()) -> Void {
        let urlStr = String.init(format: "http://api.k780.com/?app=finance.rate&scur=%@&tcur=%@&appkey=%@&sign=%@", scur,tcur,appKey,sign)
        let url:URL = URL.init(string: urlStr)!
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(_):
                let json = JSON(response.result.value!)
                let result:JSON = JSON(json["result"])
                let rate = Rate.init(jsonData: result)
                success(rate)
                print(result)
            case .failure(_):
                print(response.result.value as Any)
            }
        }
    }
    
    //Currency History API
    class func history(scur:String,tcur:String,date:String,success:@escaping(_ rate:Float)->()) -> Void {
        let urlStr = String.init(format: "http://api.k780.com/?app=finance.rate&scur=%@&tcur=%@&appkey=%@&sign=%@", scur,tcur,appKey,sign)
        let url:URL = URL.init(string: urlStr)!
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(_):
                let json = JSON(response.result.value!)
                let result:JSON = JSON(json["result"])
                let rate = result["rate"].floatValue
                success(rate)
                print(result)
            case .failure(_):
                print(response.result.value as Any)
            }
        }
    }
}
