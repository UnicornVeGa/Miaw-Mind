//
//  EndGameViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 04/10/25.
//

import UIKit

class EndGameViewController: UIViewController {
    
    
    @IBAction func playAgainButtonTouched(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let playGameVC = storyboard.instantiateViewController(withIdentifier: "PlayingGameViewController") as! PlayingGameViewController
        
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = .moveIn
        transition.subtype = .fromLeft
        
        navigationController?.view.layer.add(transition, forKey: kCATransition)
            
        navigationController?.setViewControllers([playGameVC], animated: true)
    }
    
    @IBAction func exitGameButttonTouched(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let exitGameVC = storyboard.instantiateViewController(withIdentifier: "MenuGamesViewController") as! MenuGamesViewController
        
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = .fade
        
        navigationController?.view.layer.add(transition, forKey: kCATransition)
            
        navigationController?.setViewControllers([exitGameVC], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false;
    }

}
