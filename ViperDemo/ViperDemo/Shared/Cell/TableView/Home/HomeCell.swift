//
//  HomeCell.swift
//  ViperDemo
//
//  Created by Craig Clayton on 9/22/15.
//  Copyright © 2015 Adept Mobile. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell, HomeItemViewProtocol {
    
    @IBOutlet var imgIcon: UIImageView!
    @IBOutlet var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(image image: String) {
        imgIcon.image = UIImage(named: image)
    }
    
    func set(name name: String) {
        lblTitle.text = name
    }
}
