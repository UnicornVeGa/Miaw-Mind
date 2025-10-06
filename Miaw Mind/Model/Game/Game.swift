//
//  Game.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 04/10/25.
//

import Foundation

class Game {
    let id: Int
    let name: String
    let ability: String
    let description: String
    
    var image: Int {
        return id
    }
    
    init(id: Int, name: String, ability: String, description: String){
        self.id = id
        self.name = name
        self.ability = ability
        self.description = description
        
        
    }
    
    convenience init() {
        self.init(id: -1, name: "", ability: "", description: "")
    }
}
