//
//  MyKittensViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 23/08/25.
//

import UIKit

class MyKittensViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var sectionDescriptionLabel: UILabel!
    
    @IBOutlet weak var myKittensBarItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = NSLocalizedString("mykittens.welcome", comment: "Welcome title")
        sectionDescriptionLabel.text = NSLocalizedString("mykittens.description", comment: "Kittens section description")
        myKittensBarItem.title = NSLocalizedString("mykittens.baritem", comment: "Kittens tab title")
    }

}
