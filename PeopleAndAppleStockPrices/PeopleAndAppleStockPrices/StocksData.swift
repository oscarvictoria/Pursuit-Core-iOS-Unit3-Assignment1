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
        let sortedStocks = Stocks.getStocks().sorted{$0.date < $1.date}
    
        var sections = Array(repeating:[Stocks](), count: sortedStocks.count)
        
        var currentIndex = 0
        
        var currentStock = sortedStocks.first?.date ?? ""
        
        for stock in sortedStocks {
            if stock.date == currentStock {
                sections[currentIndex].append(stock)
            } else {
                currentIndex += 1
                currentStock = stock.date
                sections[currentIndex].append(stock)
            }
        }
        
        return sections
        
    }
    
    
}
