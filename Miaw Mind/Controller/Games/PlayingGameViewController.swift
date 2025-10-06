//
//  PlayingGameViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 04/10/25.
//

import UIKit

class PlayingGameViewController: UIViewController {
    
    
    @IBAction func endgameButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let endGameVC = storyboard.instantiateViewController(withIdentifier: "EndGameViewController") as! EndGameViewController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = .reveal
        transition.subtype = .fromRight
        
        navigationController?.view.layer.add(transition, forKey: kCATransition)
            
        navigationController?.setViewControllers([endGameVC], animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false;
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
