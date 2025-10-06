//
//  ConfigurationViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 03/10/25.
//

import UIKit

class ConfigurationViewController: UIViewController {
    
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var soundLabel: UILabel!
    
    let userDefaults = UserDefaults.standard
    let ON_OFF_MUSIC_KEY = "OnOffMusicKey"
    let ON_OFF_SOUND_KEY = "OnOffSoundKey"
    
    
    @IBAction func musicSwitchChanged(_ sender: Any) {
        if (musicSwitch.isOn) {
            userDefaults.set(true, forKey: ON_OFF_MUSIC_KEY)
            musicLabel.isEnabled = true
        }else{
            userDefaults.set(false, forKey: ON_OFF_MUSIC_KEY)
            musicLabel.isEnabled = false
        }
    }
    
    @IBAction func soundSwitchChanged(_ sender: Any) {
        if (soundSwitch.isOn) {
            userDefaults.set(true, forKey: ON_OFF_SOUND_KEY)
            soundLabel.isEnabled = true
        } else {
            userDefaults.set(false, forKey: ON_OFF_SOUND_KEY)
            soundLabel.isEnabled = false
        }
    }
    
    @IBAction func saveSessionButtonPressend(_ sender: Any) {
        
        if InternetMonitor.shared.hayConexion {
            if InternetMonitor.shared.tipoConexion == "cell" {
                let alert = UIAlertController(title:"Atención", message:"Tu conexión a internet es por datos celulares. Para guardar tu sesión correctamente te sugerimos usar una conexión WiFi. ¿Deseas continuar?", preferredStyle:.alert)
                let btnAceptar = UIAlertAction(title:"SI", style:.default) {
                    action in
                    // procedo a descargar los datos
                    self.guardarSesionUsuario()
                }
                alert.addAction(btnAceptar)
                let btnCancelar = UIAlertAction(title:"NO", style:.cancel, handler:nil)
                alert.addAction(btnCancelar)
                self.present(alert, animated:true, completion:nil)
            }
            else {
                self.guardarSesionUsuario()
            }
        }
        else {
            
            let alert = UIAlertController(title:"Uy...", message:"Parece que no tienes conexión a internet. Por favor inténtalo más tarde.", preferredStyle:.alert)
            let btnAceptar = UIAlertAction(title:"OK", style:.default, handler:nil)
            alert.addAction(btnAceptar)
            self.present(alert, animated:true, completion:nil)
        }
    }
    
    func guardarSesionUsuario() {
        // Aquí va la lógica para almacenar la sesión del usuario vinculada a su cuenta de registro
        print("Se guarda la sesión del usuario (:")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSwitchesState()
    }
    
    func checkSwitchesState() {
        if (userDefaults.bool(forKey: ON_OFF_MUSIC_KEY)) {
            musicSwitch.setOn(true, animated: false)
            musicLabel.isEnabled = true
        }else{
            musicSwitch.setOn(false, animated: false)
            musicLabel.isEnabled = false
        }
        
        if (userDefaults.bool(forKey: ON_OFF_SOUND_KEY)) {
            soundSwitch.setOn(true, animated: false)
            soundLabel.isEnabled = true
        }else{
            soundSwitch.setOn(false, animated: false)
            soundLabel.isEnabled = false
        }
        
    }


}
