//
//  AccountViewController.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/29.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: "AccountTableViewCell")
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MoneyManager.sharedInstance.historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = MoneyManager.sharedInstance.historyArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as! AccountTableViewCell
        cell.reccord = model
        return cell
    }
    
}
