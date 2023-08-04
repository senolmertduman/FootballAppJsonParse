//
//  SettingsVC.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 31.07.2023.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
//logout button
    @IBAction func logoutButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Football App", message: "Are you sure you ant to log out?", preferredStyle: UIAlertController.Style.actionSheet)
        let noButton = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel)
        let yesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){action in
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "toLoginVC", sender: nil)
            }catch{
                self.makeAlert(title: "Error", message: error.localizedDescription)
            }
        }
        alert.addAction(noButton)
        alert.addAction(yesButton)
        self.present(alert, animated: true)
    }
//to make alert
    func makeAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}
