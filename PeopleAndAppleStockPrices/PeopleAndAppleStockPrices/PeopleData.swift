//
//  PeopleData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct People: Codable {
    let results: [PeopleData]
}

struct PeopleData: Codable {
    let gender: String
    let name: [String:String]
    let location: Location
}

struct Location: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

extension People {
    static func getUsers() -> [PeopleData] {
        var users = [PeopleData]()
        guard let fileURL = Bundle.main.url(forResource: "userinfo", withExtension: "json") else {
        fatalError("could not locate json file")
    }
        do {
            let data = try Data(contentsOf: fileURL)
                      let userData = try JSONDecoder().decode(People.self, from: data)
            users = userData.results
        } catch {
            fatalError("error: \(error)")
        }
        return users
}
}
