//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Oscar Victoria Gonzalez  on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {

@IBOutlet weak var tableView: UITableView!
    

    var theStocks = [[Stocks]]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        theStocks = Stocks.getstockSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stockDVC = segue.destination as? StocksDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("error")
        }
        let stock = theStocks[indexPath.section][indexPath.row]
        stockDVC.datailStock = stock
    }
    
}

extension StocksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        theStocks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        let stocks = theStocks[indexPath.section][indexPath.row]
        cell.textLabel?.text = stocks.date
        cell.detailTextLabel?.text = stocks.open.description
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        theStocks.count

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return theStocks[section].first?.label.components(separatedBy: " ").first ?? ""
    }
}
