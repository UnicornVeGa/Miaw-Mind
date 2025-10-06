//
//  GamesDataManager.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 04/10/25.
//

import Foundation

class GamesDataManager{
    
    static let shared = GamesDataManager()
    
    private var games: [Game] = [
        Game(id: 0, name: "¡Recuérdameaw!", ability: "Memoria visual", description: "Observa un gatito con un patrón de pelaje, colores y accesorios. Tienes 5 segundos para memorizarlo. Después, deberás identificarlo entre varias opciones."),
        Game(id: 1, name: "Miaw miau", ability: "Memoria musical", description: "Escucha la secuencia de sonidos y repítela tocando a los gatitos en el orden correcto."),
        Game(id: 2, name: "Cuenta gatitos", ability: "Cálculo mental", description: "Mira la secuencia de gatitos de colores: cada color vale un número distinto. Calcula el total antes de que se acabe el tiempo y demuestra tu agilidad mental."),
        Game(id: 3, name: "¡Atrapa el ratón!", ability: "Reflejos", description: "Los ratones corren por la pantalla y tú debes atraparlos antes de que invadan la casa de tus gatitos."),
        Game(id: 4, name: "Memoramiaw", ability: "Memoria", description: "Encuentra las parejas de gatitos, pero cuidado: algunos distractores cambiarán las posiciones de las tarjetas cuando menos lo esperes.")
        ]
    
    func countGames() -> Int {
        return games.count
    }
    
    func getGames() -> [Game] {
        return games
    }
    
    func getGame(at index: Int) -> Game {
        return games[index]
    }
    
}
