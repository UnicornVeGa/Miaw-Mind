//
//  GamesSectionViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 23/08/25.
//

import UIKit

class GamesSectionViewController: UIViewController {

    @IBOutlet weak var titleSectionLabel: UILabel!
    @IBOutlet weak var sectionDescriptionLabel: UILabel!
    
    @IBOutlet weak var gamesBarItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleSectionLabel.text = NSLocalizedString("games.title", comment: "Games section title")
        sectionDescriptionLabel.text = NSLocalizedString("games.description", comment: "Games section description")
        
    }
}
