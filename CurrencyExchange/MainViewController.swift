//
//  MainViewController.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/16.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var formLabel: UILabel!
    
    @IBOutlet weak var sourButton: UIButton!
    @IBOutlet weak var sourIcon: UIImageView!
    @IBOutlet weak var sourLabel: UILabel!
    @IBOutlet weak var sourFullNameLabel: UILabel!
    @IBOutlet weak var sourArrow: UIImageView!
    @IBOutlet weak var sourTextField: UITextField!
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var tourButton: UIButton!
    @IBOutlet weak var tourIcon: UIImageView!
    @IBOutlet weak var tourLabel: UILabel!
    @IBOutlet weak var tourFullNameLabel: UILabel!
    @IBOutlet weak var tourArrow: UIImageView!
    @IBOutlet weak var tourTextField: UITextField!
    
    @IBOutlet weak var exchangeButton: UIButton!

    var scur:String = "AUD"
    var tcur:String = "CNY"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sourLabel.text = self.scur
        self.tourLabel.text = self.tcur
        self.sourIcon.image = UIImage.init(named: "australia")
        self.tourIcon.image = UIImage.init(named: "china")
        self.layoutUI()
    }
    func layoutUI() -> Void {
        self.headLabel.sizeToFit()
        self.headLabel.frame = CGRect.init(x: 15, y: (self.navigationController?.navigationBar.bottom)! + 20, width: self.headLabel.width, height: self.headLabel.height)
        
        let leftMargin:CGFloat = 15
        self.formLabel.sizeToFit()
        self.formLabel.frame = CGRect.init(x: leftMargin, y: self.headLabel.bottom + 30, width: self.formLabel.width, height: self.formLabel.height)
        
        let buttonWidth:CGFloat = (screenWidth - leftMargin * 2 - 10) * 0.5
        let buttonHeight:CGFloat = 90
        self.sourButton.frame = CGRect.init(x: leftMargin, y: self.formLabel.bottom + 20, width: buttonWidth, height: buttonHeight)
        self.sourButton.layer.cornerRadius = 5

        self.sourIcon.frame = CGRect.init(x: leftMargin + 5, y: self.sourButton.top + (self.sourButton.height - 30) * 0.5, width: 30, height: 30)
        
        self.sourLabel.sizeToFit()
        self.sourLabel.frame = CGRect.init(x: self.sourIcon.right + 10, y: self.sourIcon.top + 5, width: self.sourLabel.width, height: self.sourLabel.height)
        self.sourFullNameLabel.sizeToFit()
        self.sourFullNameLabel.frame = CGRect.init(x: leftMargin + 5, y: self.sourIcon.bottom + 10, width: self.sourButton.width - 10, height: self.sourFullNameLabel.height)

        self.sourArrow.frame = CGRect.init(x: self.sourButton.right - 20 - 5, y: self.sourButton.top + (self.sourButton.height - 40) * 0.5, width: 20, height: 40)
        
        self.sourTextField.frame = CGRect.init(x: self.sourButton.right + 10, y: self.sourButton.top, width: buttonWidth, height: buttonHeight)
//        self.sourTextField.layer.borderWidth = 0.5
        self.sourTextField.layer.cornerRadius = 5
        self.sourTextField.clipsToBounds = true
        self.toLabel.sizeToFit()
        self.toLabel.frame = CGRect.init(x: leftMargin, y: self.sourButton.bottom + 30, width: self.toLabel.width, height: self.toLabel.height)
        //
        self.tourButton.frame = CGRect.init(x: leftMargin, y: self.toLabel.bottom + 30, width: buttonWidth, height: buttonHeight)
        self.tourButton.layer.cornerRadius = 5

        self.tourIcon.frame = CGRect.init(x: leftMargin + 5, y: self.tourButton.top + (self.tourButton.height - 30) * 0.5, width: 30, height: 30)
        
        self.tourLabel.sizeToFit()
        self.tourLabel.frame = CGRect.init(x: self.tourIcon.right + 10, y: self.tourIcon.top + 5, width: self.tourLabel.width, height: self.tourLabel.height)
        
        self.tourFullNameLabel.sizeToFit()
        self.tourFullNameLabel.frame = CGRect.init(x: leftMargin + 5, y: self.tourIcon.bottom + 10, width: self.tourButton.width - 10, height: self.tourFullNameLabel.height)
        
        self.tourArrow.frame = CGRect.init(x: self.tourButton.right - 20 - 5, y: self.tourButton.top + (self.tourButton.height - 40) * 0.5, width: 20, height: 40)
        
        self.tourTextField.frame = CGRect.init(x: self.tourButton.right + 10, y: self.tourButton.top, width: buttonWidth, height: buttonHeight)
//        self.tourTextField.layer.borderWidth = 0.5
        self.tourTextField.layer.cornerRadius = 5
        self.tourTextField.clipsToBounds = true
        self.exchangeButton.frame = CGRect.init(x: (screenWidth - 180) * 0.5, y: self.tourTextField.bottom + 30, width: 180, height: 50)
        
//        self.exchangeButton.layer.borderWidth = 0.5
        self.exchangeButton.layer.borderColor = UIColor.lightGray.cgColor
        self.exchangeButton.layer.cornerRadius = 5
        self.exchangeButton.clipsToBounds = true
    }
    @IBAction func scurButtonClick(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyListViewController") as! CurrencyListViewController
        vc.selectedBlock = { currency in
            self.scur = currency.name
            self.sourLabel.text = self.scur
            self.sourFullNameLabel.text = currency.fullName
            self.sourIcon.image = UIImage.init(named: currency.image)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tcurButtonClick(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyListViewController") as! CurrencyListViewController
        vc.selectedBlock = { currency in
            self.tcur = currency.name
            self.tourLabel.text = self.tcur
            self.tourFullNameLabel.text = currency.fullName
            self.tourIcon.image = UIImage.init(named: currency.image)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func exchangeButtonClick(_ sender: Any) {
        if let s:NSString = self.sourTextField!.text as NSString? {
            let a:Int = Int(s.intValue)
            NetworkManager.exchange(scur: self.scur, tcur: self.tcur) { (rateModel) in
                let result = String.init(format: "%f", Float(a) * rateModel.rate!)
                self.tourTextField.text = result;
            }
        }
    }
}
