//
//  TeamVC.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 4.08.2023.
//

import UIKit

class TeamVC: UIViewController {
    var takimim = Teams()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = takimim.name
        
    }
   
}
