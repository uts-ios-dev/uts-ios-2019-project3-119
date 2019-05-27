//
//  Currency.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/16.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import SwiftyJSON

class Currency: NSObject {
    var name:String!
    var image:String!
    var fullName:String!
    
    class func createCurrency(name:String,image:String,fullName:String) -> Currency {
        let c = Currency()
        c.name = name
        c.image = image
        c.fullName = fullName
        return c
    }
}

class Rate: NSObject {
    var rate:Float?
    var scur:String?
    var ratenm:String?
    var tcur:String?
    var status:String?
    var update:String?
    
    init(jsonData: JSON) {
        rate = jsonData["rate"].floatValue
        scur = jsonData["scur"].stringValue
        ratenm = jsonData["ratenm"].stringValue
        tcur = jsonData["tcur"].stringValue
        status = jsonData["status"].stringValue
        update = jsonData["update"].stringValue
    }
    
}
