//
//  ProductViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 23/08/25.
//

import UIKit

class ProductViewController: UIViewController {

    var selectedProduct = Product()
    
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var imageProductLabel: UIImageView!
    @IBOutlet weak var descriptionProductLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    
    @IBOutlet weak var purchaseButton: UIButton!
    
    @IBOutlet weak var returnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        purchaseButton.setTitle(NSLocalizedString("button.buy", comment: ""), for: .normal)
        returnButton.setTitle(NSLocalizedString("button.return", comment: ""), for: .normal)
        nameProductLabel.text = selectedProduct.name
        descriptionProductLabel.text = selectedProduct.description
        priceProductLabel.text = "$ \(selectedProduct.price).00"
    }
    

    @IBAction func purchaseButtonTapped(_ sender: UIButton) {
        
        // Create UIAlertController con cadenas localizables
            let alertMessage = UIAlertController(
                title: NSLocalizedString("alert.confirm_title", comment: "Alert title"),
                message: NSLocalizedString("alert.confirm_message", comment: "Alert message"),
                preferredStyle: .alert
            )
            
            // Acción OK
            let okAction = UIAlertAction(
                title: NSLocalizedString("alert.ok", comment: "Alert OK button"),
                style: .cancel
            ) { _ in
                print("Clicked Ok")
            }
            alertMessage.addAction(okAction)
            
            // Acción Cancelar
            let cancelAction = UIAlertAction(
                title: NSLocalizedString("alert.cancel", comment: "Alert Cancel button"),
                style: .default
            ) { _ in
                print("Clicked Cancel")
            }
            alertMessage.addAction(cancelAction)
            
            // Present alert
            self.present(alertMessage, animated: true, completion: nil)
    }
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
