//
//  MenuGamesViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 04/10/25.
//

import UIKit

class MenuGamesViewController: UIViewController {
    
    var selectedGame = Game()
    
    @IBOutlet weak var gamesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = gamesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            //layout.minimumInteritemSpacing = 8
            //layout.minimumLineSpacing = 10
            layout.sectionInset = .init(top: 8, left: 15, bottom: 8, right: 15)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension MenuGamesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GamesDataManager.shared.countGames()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gamesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GameCollectionViewCell
        
        cell.gameNameLabel.text = GamesDataManager.shared.getGame(at: indexPath.row).name
        cell.gameAbilityLabel.text = GamesDataManager.shared.getGame(at: indexPath.row).ability
        cell.layer.borderWidth = 0.7
        cell.layer.cornerRadius = 20
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 50) / 2
        return CGSize(width: width, height:150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Juego seleccionado: \(indexPath)")
        selectedGame = GamesDataManager.shared.getGame(at: indexPath.row)
        //self.performSegue(withIdentifier: "showProductSegue", sender: self)
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // obtener el indexpath de la celda seleccionada
        if let gameSelection = gamesCollectionView.indexPathsForSelectedItems {
            //print(gameSelection.first?.row ?? 0)
            // buscar el juego que corresponde, segun la fila que tocó el usuario
            let game = GamesDataManager().getGame(at: gameSelection.first?.row ?? 0) // aquí ya estaríamos recuperando el juego completo con sus propiedades y atributos que seleccionó el usuario
            //print(game.name)
            //segue.destination.libro = unLibro(el que selecciono el usuario)
            if let vc = segue.destination as? IntroGameViewController {
                vc.game = game
            }else{
                
            }
        }
        
    }
    
    
}
