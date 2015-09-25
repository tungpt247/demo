//
//  DiscoverCell.swift
//  ViperDemo
//
//  Created by Craig Clayton on 9/19/15.
//  Copyright © 2015 Adept Mobile. All rights reserved.
//

import UIKit

class GenreCell: UITableViewCell, GenreListItemViewProtocol {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var imgBackground: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(image image: String) {
        imgBackground.image = UIImage(named: image)
    }
    
    func set(name name: String) {
        lblTitle.text = name.uppercaseString
    }
}
