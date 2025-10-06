//
//  CategoryViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 23/08/25.
//

import UIKit

class CategoryViewController: UIViewController {
    var category = StoreCategory()
    let dataManager = StoreDataManager()
    var productsList: [Product] = []
    var selectedProduct = Product()
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        categoryNameLabel.text = category.name
        //productsList = dataManager.getCategoryProducts(for: category.id)
        
        print("category ID: \(category.id)")
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Numero de productos: \(productsList.count)")
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product_cell", for: indexPath) as! ProductCell
        print("Numero de posicion de celda: \(indexPath)")
        let product = productsList[indexPath.row]
        
        cell.productNameLabel.text = product.name
        cell.productPriceLabel.text = String("$ \(product.price).00")
        
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath){
        selectedProduct = productsList[indexPath.row]
        self.performSegue(withIdentifier: "showProductSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ProductViewController
        destinationViewController.selectedProduct = self.selectedProduct
    }
    
    
}
