//
//  ProductPurchaseViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 05/10/25.
//

import UIKit

class ProductPurchaseViewController: UIViewController {
    
    var selectedProduct = Product()
    
    @IBOutlet weak var imageProductLabel: UIImageView!
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var descriptionProductLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    
    @IBOutlet weak var quantityControllersStackView: UIStackView!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var quantityStepper: UIStepper!
    
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
        priceProductLabel.text = "$ \(selectedProduct.price)"
        
        if selectedProduct.category.id == 0 {
            quantityField.isHidden = true
            quantityStepper.isHidden = true
        } else {
            quantityField.text = "1"
            quantityField.isEnabled = false
            
            quantityStepper.minimumValue = 1
            quantityStepper.maximumValue = 10
        }

    }
    
    
    @IBAction func quantityStepperValueChanged(_ sender: UIStepper) {
        print(quantityStepper.value)
        quantityField.text = String(Int(quantityStepper.value))
        priceProductLabel.text = "$ \(String(selectedProduct.price * Int(quantityStepper.value)))"
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
