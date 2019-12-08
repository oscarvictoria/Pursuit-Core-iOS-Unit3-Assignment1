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
    let name: Name
    let email: String
    let dob: String
    let phone: String
    let location: Location
    let picture: Picture
}

struct Name: Codable {
    let first: String
    let last: String
    let title: String
    var fullName: String {
        "\(first) \(last)"
    }
}


struct Picture: Codable {
    let large: String
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
