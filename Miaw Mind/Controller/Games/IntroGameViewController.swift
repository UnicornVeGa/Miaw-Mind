//
//  IntroGameViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 04/10/25.
//

import UIKit

class IntroGameViewController: UIViewController {
    
    var game: Game?
    
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var bestScoreLabel: UILabel!
    @IBOutlet weak var bestTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if game != nil {
            llenarInfo()
        }
    }
    
    func llenarInfo() {
        gameNameLabel.text = game?.name ?? "Game Name"
        gameDescriptionLabel.text = game?.description ?? "Game Description"
    }
    
}
