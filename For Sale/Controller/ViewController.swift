//
//  ViewController.swift
//  For Sale
//
//  Created by Hayden Jamieson on 01/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        ProductsService.shared.delegate = self
        ProductsService.shared.observeProducts()
    }

    @IBAction func addTapped(_ sender: Any) {
        AlertService.addProductAlert(in: self) { (product) in
            ProductsService.shared.post(product: product)
        }
    }
    
    @IBAction func onSubscribeTapped(_ sender: Any) {
        AlertService.subscribeAlert(in: self)
    }
    

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell else {return UICollectionViewCell()}
        cell.configureCell(withProduct: products[indexPath.item])
        return cell
    }
    
}

extension ViewController: ProductsServiceDelegate {
    
    func didChange(products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
    
    
}

