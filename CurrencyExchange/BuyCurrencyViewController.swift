//
//  BuyCurrencyViewController.swift
//  CurrencyExchange
//
//  Created by Cao,Xiangzhao on 2019/5/29.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class BuyCurrencyViewController: UIViewController {
    @IBOutlet weak var dollarButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var depositButton: UIButton!
    var tcur:String = ""
    var image:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dollarBtnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyListViewController") as! CurrencyListViewController
        vc.selectedBlock = { currency in
            self.dollarButton.setTitle(currency.name, for: .normal)
            self.tcur = currency.name
            self.image = currency.image

//            self.tourLabel.text = self.tcur
//            self.tourFullNameLabel.text = currency.fullName
//            self.tourIcon.image = UIImage.init(named: currency.image)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func depositBtnClick(_ sender: Any) {
        if (self.tcur == "") {
            return
        }
        if let s:NSString = self.textField!.text as NSString? {
            let a:Int = Int(s.intValue)
            NetworkManager.exchange(scur: "AUD", tcur: self.tcur) { (rateModel) in
                let result = String.init(format: "%.0f", Float(a) * rateModel.rate!)
                MoneyManager.sharedInstance.allCount = MoneyManager.sharedInstance.allCount - a
                let record = RecordModel.createRecord(tcur: self.tcur, image: self.image, num: result)
                MoneyManager.sharedInstance.historyArray.append(record)
                print(MoneyManager.sharedInstance.historyArray)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

}
