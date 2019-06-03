//
//  HistoryViewController.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/18.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var sourIcon: UIImageView!
    @IBOutlet weak var sourLabel: UILabel!
    @IBOutlet weak var sourFullNameLabel: UILabel!
    
    @IBOutlet weak var tourIcon: UIImageView!
    @IBOutlet weak var tourLabel: UILabel!
    @IBOutlet weak var tourFullNameLabel: UILabel!
    
    @IBOutlet weak var dataButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    var scur:String = ""
    var tour:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sourIcon.layer.cornerRadius = 5
        self.tourIcon.layer.cornerRadius = 5
    }
    
    @IBAction func chooseDate(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DateViewController") as! DateViewController
        vc.dateSelected = { (date) in
            self.dataButton.setTitle(date, for: .normal)
            NetworkManager.history(scur: self.scur, tcur: self.tour, date: date, success: { (rate) in
                self.resultLabel.text = "\(rate)"
            })
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sourTap(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyListViewController") as! CurrencyListViewController
        vc.selectedBlock = { currency in
            self.scur = currency.name
            self.sourLabel.text = self.scur
            self.sourFullNameLabel.text = currency.fullName
            self.sourIcon.image = UIImage.init(named: currency.image)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tourTap(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyListViewController") as! CurrencyListViewController
        vc.selectedBlock = { currency in
            self.tour = currency.name
            self.tourLabel.text = self.tour
            self.tourFullNameLabel.text = currency.fullName
            self.tourIcon.image = UIImage.init(named: currency.image)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


