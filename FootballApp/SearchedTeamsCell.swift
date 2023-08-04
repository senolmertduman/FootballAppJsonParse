//
//  SearchedTeamsCell.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 4.08.2023.
//

import UIKit

class SearchedTeamsCell: UITableViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
