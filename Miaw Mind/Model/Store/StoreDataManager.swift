//
//  CatDataManager.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 21/08/25.
//

import Foundation

class StoreDataManager{
    
    private var storeCategories: [StoreCategory] = []
    private var storeProducts: [Product] = []
    
    // Este diccionario simula ser un servicio de información de un repositorio remoto
    let storeCategoriesDictionary: [Int: String] = [
        0: NSLocalizedString("category.0", comment: ""),
        1: NSLocalizedString("category.1", comment: ""),
        2: NSLocalizedString("category.2", comment: ""),
        3: NSLocalizedString("category.3", comment: ""),
        4: NSLocalizedString("category.4", comment: "")
    ]
    
    let storeProductsDictionary: [Int: (name: String, description: String, price: Int, categoryId: Int)] = [
        // ¡Adopta un gatito!
        0: (NSLocalizedString("product.0.name", comment: ""), NSLocalizedString("product.0.desc", comment: ""), 200, 0),
        1: (NSLocalizedString("product.1.name", comment: ""), NSLocalizedString("product.1.desc", comment: ""), 400, 0),
        2: (NSLocalizedString("product.2.name", comment: ""), NSLocalizedString("product.2.desc", comment: ""), 450, 0),
        3: (NSLocalizedString("product.3.name", comment: ""), NSLocalizedString("product.3.desc", comment: ""), 250, 0),
        4: (NSLocalizedString("product.4.name", comment: ""), NSLocalizedString("product.4.desc", comment: ""), 300, 0),
        5: (NSLocalizedString("product.5.name", comment: ""), NSLocalizedString("product.5.desc", comment: ""), 500, 0),

        // Comida y premios
        6: (NSLocalizedString("product.6.name", comment: ""), NSLocalizedString("product.6.desc", comment: ""), 50, 1),
        7: (NSLocalizedString("product.7.name", comment: ""), NSLocalizedString("product.7.desc", comment: ""), 100, 1),
        8: (NSLocalizedString("product.8.name", comment: ""), NSLocalizedString("product.8.desc", comment: ""), 150, 1),
        9: (NSLocalizedString("product.9.name", comment: ""), NSLocalizedString("product.9.desc", comment: ""), 80, 1),
        10: (NSLocalizedString("product.10.name", comment: ""), NSLocalizedString("product.10.desc", comment: ""), 120, 1),

        // Juguetes
        11: (NSLocalizedString("product.11.name", comment: ""), NSLocalizedString("product.11.desc", comment: ""), 60, 2),
        12: (NSLocalizedString("product.12.name", comment: ""), NSLocalizedString("product.12.desc", comment: ""), 40, 2),
        13: (NSLocalizedString("product.13.name", comment: ""), NSLocalizedString("product.13.desc", comment: ""), 200, 2),
        14: (NSLocalizedString("product.14.name", comment: ""), NSLocalizedString("product.14.desc", comment: ""), 90, 2),

        // Salud e higiene
        15: (NSLocalizedString("product.15.name", comment: ""), NSLocalizedString("product.15.desc", comment: ""), 300, 3),
        16: (NSLocalizedString("product.16.name", comment: ""), NSLocalizedString("product.16.desc", comment: ""), 200, 3),
        17: (NSLocalizedString("product.17.name", comment: ""), NSLocalizedString("product.17.desc", comment: ""), 80, 3),
        18: (NSLocalizedString("product.18.name", comment: ""), NSLocalizedString("product.18.desc", comment: ""), 70, 3),
        19: (NSLocalizedString("product.19.name", comment: ""), NSLocalizedString("product.19.desc", comment: ""), 60, 3),

        // Decoración
        20: (NSLocalizedString("product.20.name", comment: ""), NSLocalizedString("product.20.desc", comment: ""), 180, 4),
        21: (NSLocalizedString("product.21.name", comment: ""), NSLocalizedString("product.21.desc", comment: ""), 50, 4),
        22: (NSLocalizedString("product.22.name", comment: ""), NSLocalizedString("product.22.desc", comment: ""), 300, 4),
        23: (NSLocalizedString("product.23.name", comment: ""), NSLocalizedString("product.23.desc", comment: ""), 70, 4),
        24: (NSLocalizedString("product.24.name", comment: ""), NSLocalizedString("product.24.desc", comment: ""), 40, 4)
    ]

    
    /*let storeProductsDictionary: [Int: (name: String, description: String, price: Int, categoryId: Int)] = [
        // ¡Adopta un gatito!
        0: ("Gatito pardo", "Un adorable gatito de pelaje marrón claro y ojos dulces.", 200, 0),
        1: ("Gatito persa", "Pelaje largo y esponjoso, ideal para quienes aman acariciar.", 400, 0),
        2: ("Gatito egipcio", "Elegante, con un aire misterioso y orejas puntiagudas.", 450, 0),
        3: ("Gatito naranjoso", "Cariñoso y juguetón, con un pelaje naranja vibrante.", 250, 0),
        4: ("Gatito negro", "Misterioso pero leal, perfecto para noches de ternura.", 300, 0),
        5: ("Gatito siamés", "Inteligente y comunicativo, con ojos azules brillantes.", 500, 0),
        
        // Comida y premios
        6: ("Croquetas", "Alimento balanceado para mantener saludable a tu gatito.", 50, 1),
        7: ("Croquetas premium", "Receta de alta calidad con ingredientes seleccionados.", 100, 1),
        8: ("Salmón", "Un premio delicioso y nutritivo para consentirlo.", 150, 1),
        9: ("Catnip", "Hierba que estimula y alegra a tu gatito.", 80, 1),
        10: ("Churus", "Snack cremoso que fortalece el vínculo con tu mascota.", 120, 1),
        
        // Juguetes
        11: ("Ratón", "Juguete clásico para despertar su instinto cazador.", 60, 2),
        12: ("Pelota", "Pelota ligera para horas de diversión.", 40, 2),
        13: ("Rascador", "Accesorio esencial para cuidar sus uñas y tu sofá.", 200, 2),
        14: ("Caña con plumas", "Perfecta para jugar y ejercitar a tu gatito.", 90, 2),
        
        // Salud e higiene
        15: ("Vacuna", "Protege la salud de tu gatito contra enfermedades.", 300, 3),
        16: ("Medicina", "Tratamiento especial para cuando tu gatito no se sienta bien.", 200, 3),
        17: ("Shampoo", "Suave y seguro para mantener su pelaje limpio y brillante.", 80, 3),
        18: ("Perfume", "Fragancia ligera para que siempre huela fresco.", 70, 3),
        19: ("Cepillo", "Mantén su pelaje desenredado y sin bolas de pelo.", 60, 3),
        
        // Decoración
        20: ("Cama", "Cómoda y acolchada para que tu gatito descanse.", 180, 4),
        21: ("Plato", "De cerámica con diseño elegante y fácil de limpiar.", 50, 4),
        22: ("Casa", "Un espacio propio para que juegue y se esconda.", 300, 4),
        23: ("Planta", "Decoración amigable y segura para gatitos.", 70, 4),
        24: ("Wallpaper", "Personaliza el espacio virtual con fondos únicos.", 40, 4)
    ]*/

    
    func fetchCategories(){
        for category in storeCategoriesDictionary{
            storeCategories.append(StoreCategory(id: category.key,
                                                 name: category.value))
        }
        storeCategories.sort{ $0.id < $1.id }
    }
    
    func fetchProducts() {
        for product in storeProductsDictionary {
            if let category = storeCategories.first(where: { $0.id == product.value.categoryId }) {
                let newProduct = Product(
                    id: product.key,
                    name: product.value.name,
                    description: product.value.description,
                    price: product.value.price,
                    category: category
                )
                storeProducts.append(newProduct)
                
            }
        }
        storeProducts.sort { $0.id < $1.id }
        print("Cantidad de productos: \(storeProducts.count)")
    }
    
    // Función para obtener una categoría en una posición específica:
    func getCategory(at index: Int) -> StoreCategory{
        return storeCategories[index]
    }
    
    // Función para obtener un producto en una posición específica:
    func getProduct(at index: Int) -> Product{
        return storeProducts[index]
    }
    
    // Función que retorna el número de categorías que se tienen
    func countCategories() -> Int{
        return storeCategories.count
    }
    
    // Función que retorna los productos para una categoría específica
    func getCategoryProducts(for categoryId: Int) -> [Product]{
        return storeProducts.filter{ $0.category.id == categoryId }
    }
    
}
