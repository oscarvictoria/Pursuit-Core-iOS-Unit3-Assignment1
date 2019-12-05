//
//  StocksDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Oscar Victoria Gonzalez  on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailViewController: UIViewController {
    
var datailStock: Stocks?
    
@IBOutlet weak var detailImageView: UIImageView!
@IBOutlet weak var detailDateLabel: UILabel!
@IBOutlet weak var openingLabel: UILabel!
@IBOutlet weak var closingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let someStock = datailStock else {
            fatalError()
        }
        detailDateLabel.text = someStock.date
        openingLabel.text = "Open: \(someStock.open.description)"
        closingLabel.text = "Close: \(someStock.close.description)"
        
        if someStock.open < someStock.close {
            view.backgroundColor = .green
            detailImageView.image = #imageLiteral(resourceName: "thumbsUp")
        } else {
            view.backgroundColor = .red
            detailImageView.image = #imageLiteral(resourceName: "thumbsDown")
        }
        
    }
    
}
