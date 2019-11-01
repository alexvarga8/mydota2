//
//  ItemCollectionViewCell.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 15/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit
import Kingfisher

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var dotaItem: DotaItem? {
        didSet {
            if let dotaItem = dotaItem {
                
                let baseURL = "https://steamcdn-a.akamaihd.net/apps/dota2/images/items/"
                let photoURL = dotaItem.itemPhoto
                let url = URL(string: baseURL + photoURL)
                
                imageView.kf.setImage(with: url)
                
                nameLabel.adjustsFontSizeToFitWidth = true
                nameLabel.text = dotaItem.itemName
            }
        }
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        nameLabel.text = nil
    }
    
}
