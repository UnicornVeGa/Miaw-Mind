//
//  EditProfileViewController.swift
//  Miaw Mind
//
//  Created by Cinthya Vélez Grande on 05/10/25.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    
    @IBOutlet weak var nicknameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    let USER_NICKNAME_KEY = "UserNicknameKey"
    let USER_GENDER_KEY = "UserGenderKey"
    let USER_EMAIL_KEY = "UserEmailKey"
    let USER_COUNTRY_KEY = "UserCountryKey"
    
    var buttonState: Bool = true
    
    @IBAction func editButtonTouched(_ sender: Any) {
        
        if buttonState {
            nicknameField.isEnabled = true
            genderSegmentedControl.isEnabled = true
            editButton.setTitle("Guardar", for: .normal)
            
            editButton.backgroundColor = UIColor(named: "AccentColor")
            editButton.setTitleColor(.white, for: .normal)
            
        }else{
            nicknameField.isEnabled = false
            genderSegmentedControl.isEnabled = false
            UserDefaults.standard.set(nicknameField.text, forKey: USER_NICKNAME_KEY)
            UserDefaults.standard.set(genderSegmentedControl.selectedSegmentIndex, forKey: USER_GENDER_KEY)
            editButton.setTitle("Editar", for: .normal)
            
            editButton.backgroundColor = .systemGray6
            editButton.setTitleColor(UIColor(named: "AccentColor"), for: .normal)
        }

        buttonState.toggle()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserInfo()
        
        nicknameField.isEnabled = false
        emailField.isEnabled = false
        genderSegmentedControl.isEnabled = false
        countryField.isEnabled = false
        
        editButton.layer.cornerRadius = 10
        editButton.layer.masksToBounds = true
    }
    
    func checkUserInfo(){
        nicknameField.text = UserDefaults.standard.string(forKey: USER_NICKNAME_KEY)
        emailField.text = UserDefaults.standard.string(forKey: USER_EMAIL_KEY)
        countryField.text = UserDefaults.standard.string(forKey: USER_COUNTRY_KEY)
        genderSegmentedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: USER_GENDER_KEY)
    }
    
}
