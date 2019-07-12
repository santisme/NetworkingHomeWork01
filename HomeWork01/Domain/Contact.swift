//
//  Contact.swift
//  HomeWork01
//
//  Created by Santiago Sanchez merino on 12/07/2019.
//  Copyright © 2019 Santiago Sanchez Merino. All rights reserved.
//

import Foundation

struct Contact {
    var id: Int!
    var name: String!
    var username: String!
    var email: String!
    var address: Address!
    var phone: String!
    var website: String!
    var company: Company!
    
    init(dict: [String: Any]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        username = dict["username"] as? String
        email = dict["email"] as? String
        if let addressDict = dict["address"] as? [String: Any] {
            if let geoDict = addressDict["geo"] as? [String: Any] {
                let geo = Geo(lat: geoDict["lat"] as? String,
                              lng: geoDict["lng"] as? String)
                address = Address(street: addressDict["street"] as? String,
                                  suite: addressDict["suite"] as? String,
                                  city: addressDict["city"] as? String,
                                  zipcode: addressDict["zipcode"] as? String,
                                  geo: geo)
            }
        }
        phone = dict["phone"] as? String
        website = dict["website"] as? String
        
        if let companyDict = dict["company"] as? [String: Any] {
            company = Company(name: companyDict["name"] as? String
                , catchPhrase: companyDict["catchPhrase"] as? String, bs: companyDict["bs"] as? String)
        }

    }
    
}
