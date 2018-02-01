//
//  ProductCell.swift
//  For Sale
//
//  Created by Hayden Jamieson on 01/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureCell(withProduct product: Product) {
        titleLabel.text = product.title
        priceLabel.text = product.price()
    }
}
