//
//  ProductsService.swift
//  For Sale
//
//  Created by Hayden Jamieson on 02/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate {
    func didChange(products: [Product])
}

class ProductsService {
    
    private init() {}
    static let shared = ProductsService()
    var delegate: ProductsServiceDelegate?
    
    func observeProducts() {
        FIRDatabaseService.shared.observe(.products) { (snapshot) in
            guard let productSnapshot = ProductsSnapshot(snapshot: snapshot) else {return}
            self.delegate?.didChange(products: productSnapshot.products)
        }
    }
    
    func post(product: Product) {
        FIRDatabaseService.shared.post(parameters: product.parameters(), toDatabaseRef: .products)
    }
    
    
}
