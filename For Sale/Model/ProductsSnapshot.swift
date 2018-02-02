//
//  ProductsSnapshot.swift
//  For Sale
//
//  Created by Hayden Jamieson on 02/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import Foundation
import Firebase

struct ProductsSnapshot {
    let products: [Product]
    
    init?(snapshot: DataSnapshot) {
        guard let snapDict = snapshot.value as? [String: [String: Any]] else {return nil}
        var products = [Product]()
        
        for snap in snapDict {
            guard let product = Product(valueDict: snap.value) else {continue}
            products.append(product)
        }
        self.products = products
    }
}
