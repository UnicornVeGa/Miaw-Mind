//
//  ProfileSectionViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 23/08/25.
//

import UIKit

    class ProfileSectionViewController: UIViewController {
        
        @IBOutlet weak var sectionTitleLabel: UILabel!
        @IBOutlet weak var sectionDescriptionLabel: UILabel!
        
        @IBOutlet weak var profileBarItem: UITabBarItem!
        
        override func viewDidLoad() {
            super.viewDidLoad()

            sectionTitleLabel.text = NSLocalizedString("profile.title", comment: "Profile section title")
            sectionDescriptionLabel.text = NSLocalizedString("profile.description", comment: "Profile section description")
            
        }
        
    }
