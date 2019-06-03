//
//  MoneyManager.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/29.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class MoneyManager: NSObject {

    var allCount:Int = 1000000
    var historyArray:[RecordModel] = [RecordModel]()
    static let sharedInstance = MoneyManager()
}
