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
//        let sortedStocks = Stocks.getStocks().sorted{$0.date < $1.date}
//
//        let months = sortedStocks.sorted
        
       let stocks = getStocks()
        // 2017 08 31 [0] + [1] = 201709
    
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
    
//    func getDate()  {
//    var theDate = Stocks.getStocks()
//
//    var labels = theDate
//
//    var theMonths = ""
//
//        for months in labels {
//            months.label = theMonths
//        }
    
//    for stock in theDate {
//        getDate = stock.label
//    }
    
        
        
//        let getDate = theDate.label
//        let start = getDate.startIndex
//        let end = getDate.index(start, offsetBy: 3)
//        let range = start...end
//        let subString = getDate[range]
    
}
    
//}
