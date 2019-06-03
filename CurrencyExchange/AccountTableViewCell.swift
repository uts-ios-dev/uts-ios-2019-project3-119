//
//  AccountTableViewCell.swift
//  CurrencyExchange
//
//  Created by Cao,Xiangzhao on 2019/5/29.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    var icon:UIImageView!
    var nameLabel:UILabel!
    var fullNameLabel:UILabel!

    var reccord:RecordModel!{
        didSet {
            self.nameLabel.text = reccord.tcur
            self.fullNameLabel.text = reccord.num
            self.icon.image = UIImage.init(named: reccord.image)
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
        self.fullNameLabel.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(self.fullNameLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.icon.frame = CGRect.init(x: 15, y: (self.contentView.height - 30) * 0.5, width: 30, height: 30)
        
        self.nameLabel.sizeToFit()
        self.nameLabel.frame = CGRect.init(x: self.icon.right + 15, y: (self.contentView.frame.height - self.nameLabel.frame.height) * 0.5, width: self.nameLabel.frame.width, height: self.nameLabel.frame.height)
        
        self.fullNameLabel.sizeToFit()
        self.fullNameLabel.frame = CGRect.init(x: self.contentView.width - self.fullNameLabel.width - 15, y: (self.contentView.frame.height - self.fullNameLabel.frame.height) * 0.5, width: self.fullNameLabel.frame.width, height: self.fullNameLabel.frame.height)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
