//
//  CoinViewController.swift
//  Crypto Tracker my
//
//  Created by ha tuong do on 11/13/18.
//  Copyright © 2018 alpine. All rights reserved.
//

import UIKit
import SwiftChart

private let chartHeight : CGFloat = 300.0

class CoinViewController: UIViewController {

    var chart = Chart()
    var coin : Coin?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        // coin?.price
        chart.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: chartHeight)
        let series = ChartSeries([0, 6, 2, 8, 4, 7, 3, 10, 8])
        series.color = ChartColors.greenColor()
        chart.add(series)
        view.addSubview(chart)
    }
    

    

}
