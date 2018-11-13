//
//  CryptoTableViewController.swift
//  Crypto Tracker
//
//  Created by ha tuong do on 11/12/18.
//  Copyright © 2018 alpine. All rights reserved.
//

import UIKit

class CryptoTableViewController_save: UITableViewController {

    
    // var coins = CoinData.shared.coins
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    // override func numberOfSections(in tableView: UITableView) -> Int {

    // keep this
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of coins = ", CoinData.shared.coins.count)
        return CoinData.shared.coins.count
    }

    // uncomment to use this
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell()
        // Configure the cell...
        let coin = CoinData.shared.coins[indexPath.row]
        cell.textLabel?.text = coin.symbol
        return cell
    }
    

    
}
