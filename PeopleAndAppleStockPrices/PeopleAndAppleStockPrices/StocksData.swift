//
//  StocksData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Oscar Victoria Gonzalez  on 12/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Stocks: Codable {
    let date: String
    let open: Double
    let close: Double
    var label: String
}

extension Stocks {
    static func getStocks() -> [Stocks] {
        
        var stock = [Stocks]()
        
        
        guard let fileURL = Bundle.main.url(forResource: "applstockinfo", withExtension: "json") else {
        fatalError("could not locate json file")
    }
        do {
            let data = try Data(contentsOf: fileURL)
            let stockData = try JSONDecoder().decode([Stocks].self, from: data)
            stock = stockData
        } catch {
            fatalError("error: \(error)")
        }
        
        
        return stock
        
}
 
    static func getstockSections() -> [[Stocks]] {

        
        let stocks = getStocks()
        
//        let averageOpening = average(stocks.first!)
        
        
        
        var sections = Array(repeating:[Stocks](), count: stocks.count)
        
        var currentIndex = 0
        
        var currentStock = stocks.first?.label.components(separatedBy: " ").first ?? ""
        
        for stock in stocks {
            let month = stock.label.components(separatedBy: " ").first ?? ""
            if month == currentStock {
                sections[currentIndex].append(stock)
                                
            } else {
                currentIndex += 1
                currentStock = stock.label.components(separatedBy: " ").first ?? ""
                sections[currentIndex].append(stock)
            }
        }
        
        return sections
        
    }
    
}
    

