//
//  StoreCategory.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 22/08/25.
//

struct StoreCategory{
    let id: Int
    let name: String
    
    var image: Int {
        return id
    }
    
    var icon: Int {
        return id
    }
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
    init(){
        self.id = -1
        self.name = "Default name"
    }
}

