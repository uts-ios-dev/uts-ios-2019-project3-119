//
//  CurrencyListTableViewCell.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/16.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class CurrencyListTableViewCell: UITableViewCell {
    var icon:UIImageView!
    var nameLabel:UILabel!
    var fullNameLabel:UILabel!
    var localityIcon:UIImageView!
    var isLocality:Bool!{
        didSet {
            if (isLocality) {
                self.localityIcon.isHidden = false
            } else {
                self.localityIcon.isHidden = true
            }
        }
    }
    
    var currency:Currency!{
        didSet {
            self.nameLabel.text = currency.name
            self.fullNameLabel.text = currency.fullName
            self.icon.image = UIImage.init(named: currency.image)
            self.setNeedsLayout()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.icon = UIImageView.init()
        self.contentView.addSubview(self.icon)
        
        self.nameLabel = UILabel.init()
        self.nameLabel.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(self.nameLabel)
        
        self.fullNameLabel = UILabel.init()
        self.fullNameLabel.font = UIFont.systemFont(ofSize: 14)
        self.fullNameLabel.textColor = UIColor.lightGray
        self.contentView.addSubview(self.fullNameLabel)
        
        self.localityIcon = UIImageView.init()
        self.localityIcon.image = UIImage.init(named: "location")
        self.contentView.addSubview(self.localityIcon)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.icon.frame = CGRect.init(x: 15, y: (self.contentView.height - 30) * 0.5, width: 30, height: 30)
        
        self.nameLabel.sizeToFit()
        self.nameLabel.frame = CGRect.init(x: self.icon.right + 15, y: (self.contentView.frame.height - self.nameLabel.frame.height) * 0.5, width: self.nameLabel.frame.width, height: self.nameLabel.frame.height)
        
        self.fullNameLabel.sizeToFit()
        self.fullNameLabel.frame = CGRect.init(x: self.nameLabel.right + 15, y: (self.contentView.frame.height - self.fullNameLabel.frame.height) * 0.5, width: self.fullNameLabel.frame.width, height: self.fullNameLabel.frame.height)
        
        self.localityIcon.frame = CGRect.init(x: self.fullNameLabel.right + 10, y: (self.contentView.height - 25) * 0.5, width: 25, height: 25)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
