//
//  ProductTableViewCell.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 23/08/25.
//

import UIKit

class ProductCell: UITableViewCell {
    
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
