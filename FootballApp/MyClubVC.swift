//
//  myClubVC.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 31.07.2023.
//

import UIKit

class MyClubVC: UIViewController {
    var selectedTeam = false
    var takimim = Teams()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = takimim.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .done, target: self, action: #selector(selectTeamButton))
        
        if selectedTeam{
            navigationItem.rightBarButtonItem?.title = "Delete"
        }else{
            navigationItem.rightBarButtonItem?.title = "Select"
            
        }
    }


    @objc func selectTeamButton() {
        if selectedTeam{
            selectedTeam = false
            takimim = Teams()
            navigationItem.title = takimim.name
            navigationItem.rightBarButtonItem?.title = "Select"
        }else{
            self.performSegue(withIdentifier: "toSelectTeamVC", sender: nil)
        }
        
    }
    
}
