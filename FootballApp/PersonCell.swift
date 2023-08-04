//
//  PersonCell.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 3.08.2023.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var personPosition: UILabel!
    
    @IBOutlet weak var personName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
