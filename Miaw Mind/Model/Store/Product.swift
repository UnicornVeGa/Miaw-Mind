//
//  Product.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 22/08/25.
//

struct Product{
    let id: Int
    let name: String
    let description: String
    let price: Int
    let category: StoreCategory
    
    var image: Int {
        return id
    }
    
    init(id: Int, name: String, description: String, price: Int, category: StoreCategory){
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.category = category
    }
    
    init(){
        self.id = -1
        self.name = "Defaull name"
        self.description = "Default description"
        self.price = -1
        self.category = StoreCategory()
    }
    
}
