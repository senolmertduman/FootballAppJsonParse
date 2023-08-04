//
//  ViewController.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 31.07.2023.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordText.isSecureTextEntry = true
        
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                if error != nil{
                    self.makeAlert(tittleInput: "Error", messageInput: error?.localizedDescription ?? "error")
                }else{
                    self.performSegue(withIdentifier: "toLivescoreVC", sender: nil)
                }
            }
        }else{
            self.makeAlert(tittleInput: "Error", messageInput: "Email/Password?")
        }
    }
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                if error != nil{
                    self.makeAlert(tittleInput: "Error", messageInput: error?.localizedDescription ?? "error")
                }else{
                    self.performSegue(withIdentifier: "toLivescoreVC", sender: nil)
                }
            }
        }else{
            self.makeAlert(tittleInput: "Error", messageInput: "Email/Password?")
        }
    }
    
    func makeAlert(tittleInput:String,messageInput:String){
            let alert = UIAlertController(title: tittleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
}

