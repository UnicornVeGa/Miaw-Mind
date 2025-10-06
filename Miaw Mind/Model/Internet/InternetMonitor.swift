//
//  InternetMonitor.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 04/10/25.
//

import Foundation
import Network

// Clase singleton que permite hacer el monitoreo de internet cuando sea necesaria la conexión

class InternetMonitor: NSObject {
    
    static let shared = InternetMonitor()
    private let monitor = NWPathMonitor()
    
    var hayConexion = false
    var tipoConexion = "no"
    
    private override init() {
        super.init()
        monitor.pathUpdateHandler = { ruta in
            if ruta.status == .satisfied {
                // si hay conexión a Internet
                self.hayConexion = true
                self.tipoConexion = ruta.usesInterfaceType(.cellular) ? "cell" : "wifi"
            }
            else {
                   self.hayConexion = false
                   self.tipoConexion = "no"
               }
           }
           monitor.start(queue: DispatchQueue.global(qos: .background))
       }

}
