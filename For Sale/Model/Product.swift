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
    
    func price() -> String {
        let costString = String(format: "%.2f", cost)
        return "$" + costString
    }
}
