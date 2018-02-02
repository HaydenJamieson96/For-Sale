//
//  Product.swift
//  For Sale
//
//  Created by Hayden Jamieson on 01/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import Foundation

struct Product {
    let title: String
    let cost: Double
    
    init(title: String, cost: Double) {
        self.title = title
        self.cost = cost
    }
    
    init?(valueDict: [String: Any]) {
        guard let title = valueDict["title"] as? String, let cost = valueDict["cost"] as? Double else {return nil}
        self.title = title
        self.cost = cost
    }
    
    func price() -> String {
        let costString = String(format: "%.2f", cost)
        return "$" + costString
    }
    
    func parameters() -> [String: Any] {
        let dict: [String: Any] = ["title": title, "cost": cost]
        return dict
    }
    
}
