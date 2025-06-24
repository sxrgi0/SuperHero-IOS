//
//  SuperheroViewCell.swift
//  SuperHero-IOS
//
//  Created by Tardes on 24/6/25.
//

import UIKit

class SuperheroViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    func render(with superhero: Superhero) {
        nameLabel.text = superhero.name
        avatarImageView.loadFrom(url: superhero.image.url)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
