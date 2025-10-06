//
//  PrincipalStoreViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 04/10/25.
//

import UIKit

class PrincipalStoreViewController: UIViewController {

    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var storeCategoriesSegmentedControl: UISegmentedControl!
    
    var selectedCategoryIndex = 0
    var selectedProduct = Product()
    var products: [Product] = StoreDataManager.shared.getProducts()
    
    
    @IBAction func categoryChanged(_ sender: UISegmentedControl) {
        selectedCategoryIndex = sender.selectedSegmentIndex
        print(selectedCategoryIndex)
        
        if selectedCategoryIndex == 0 {
            products = StoreDataManager.shared.getProducts()
        } else {
            products = StoreDataManager.shared.getCategoryProducts(for: selectedCategoryIndex)
        }
        
        
        productsCollectionView.reloadData()
        productsCollectionView.setContentOffset(CGPoint.zero, animated: false)
        /*
        print(products.count)
        
        products.forEach { product in
            print(product.name)
        }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        StoreDataManager.shared.fetchCategories()
        StoreDataManager.shared.fetchProducts()
        
        print(storeCategoriesSegmentedControl.numberOfSegments)
        
        storeCategoriesSegmentedControl.setTitle("Todo", forSegmentAt: 0)
        
        for categoryIndex in (1..<storeCategoriesSegmentedControl.numberOfSegments) {
            //print(StoreDataManager.shared.getCategory(at: categoryIndex).name)
            storeCategoriesSegmentedControl.setTitle(StoreDataManager.shared.getCategory(at: categoryIndex).name, forSegmentAt: categoryIndex)
        }
        
        
        if let layout = productsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: 8, left: 25, bottom: 8, right: 25)
        }
        
        
        productsCollectionView.register(StoreProductCollectionViewCell.nib(), forCellWithReuseIdentifier: "StoreProductCollectionViewCell")
        
        products = StoreDataManager.shared.getProducts()
        productsCollectionView.reloadData()
        
    }

}

extension PrincipalStoreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
        //return StoreDataManager.shared.countProducts()
        //return categoryProducts?.count ?? StoreDataManager.shared.countProducts()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "StoreProductCollectionViewCell", for: indexPath) as! StoreProductCollectionViewCell
        
        cell.productNameLabel.text = products[indexPath.row].name
        cell.productPriceLabel.text = "$ \(String(products[indexPath.row].price))"
        
        //cell.productNameLabel.text = StoreDataManager.shared.getProduct(at: indexPath.row).name
        //cell.productPriceLabel.text = "$ \(String(StoreDataManager.shared.getProduct(at: indexPath.row).price))"
        
        cell.layer.borderWidth = 0.7
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        selectedProduct = products[indexPath.row]
        self.performSegue(withIdentifier: "showProductDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ProductPurchaseViewController
        destinationViewController.selectedProduct = self.selectedProduct
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 70) / 2
        return CGSize(width: width, height:210)
    }
    
}
