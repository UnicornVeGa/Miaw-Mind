//
//  StoreViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 23/08/25.
//

import UIKit

class StoreViewController: UIViewController {
    
    let dataManager = StoreDataManager()
    var category = StoreCategory(id: -1,name: "Vacia")
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Datos cargados")
        dataManager.fetchCategories()
        dataManager.fetchProducts()
        welcomeLabel.text = NSLocalizedString("welcome.store", comment: "")
        // Do any additional setup after loading the view.
    }
}

extension StoreViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Numero de categorías: \(dataManager.countCategories())")
        return dataManager.countCategories()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "category_cell", for: indexPath) as! StoreCategoryCell
        
        let category = dataManager.getCategory(at: indexPath.row)
        
        cell.categoryLabel.text = category.name
        print("Numero de posicion de celda: \(indexPath)")
        //cell.categoryIcon.image = UIImage(named: String(describing: category.icon))
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath){
        category = dataManager.getCategory(at: indexPath.row)
        performSegue(withIdentifier: "categorySegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
        for product in dataManager.getCategoryProducts(for: category.id) {
            print("Producto: \(product.name)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! CategoryViewController
        destinationViewController.category = self.category
        destinationViewController.productsList = dataManager.getCategoryProducts(for: self.category.id)
    }
    
    
    
}
