//
//  CoinViewController.swift
//  Crypto Tracker my
//
//  Created by ha tuong do on 11/13/18.
//  Copyright © 2018 alpine. All rights reserved.
//

import UIKit
import SwiftChart

class CoinViewController: UIViewController {

    var coin : Coin?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        coin?.price
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
