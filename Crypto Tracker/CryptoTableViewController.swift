//
//  CryptoTableViewController.swift
//  Crypto Tracker
//
//  Created by ha tuong do on 11/12/18.
//  Copyright © 2018 alpine. All rights reserved.
//

import UIKit

class CryptoTableViewController: UITableViewController, CoinDataDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        CoinData.shared.delegate = self // do this BEFORE calling getPrices() in next line
        CoinData.shared.getPrices()
        // CoinData.shared.delegate = self  <-- wrong, dont put this line below above line
    }
    
    
    func newPrices() {
        tableView.reloadData()
    }

    /*
    override func viewWillAppear(_ animated: Bool) {
        // CoinData.shared.delegate = self
        tableView.reloadData()
        // displayNetWorth()
    }
     */
    
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
        cell.textLabel?.text = "\(coin.symbol) - \(coin.price)" // <- get called before API can come back with price, so we need a "delegate"
        // cell.textLabel?.text = coin.symbol
        cell.imageView?.image = coin.image
        return cell
    }
    

    
}
