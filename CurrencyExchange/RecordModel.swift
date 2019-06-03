//
//  RecordModel.swift
//  CurrencyExchange
//
//  Created by Cao,Xiangzhao on 2019/5/29.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class RecordModel: NSObject {
    var tcur:String!
    var image:String!
    var num:String = ""
    
    class func createRecord(tcur:String,image:String,num:String) -> RecordModel {
        let c = RecordModel()
        c.tcur = tcur
        c.image = image
        c.num = num
        return c
    }
}
