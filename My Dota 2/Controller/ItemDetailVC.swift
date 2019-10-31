//
//  ItemDetailVC.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 30/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit
import Kingfisher

class ItemDetailVC: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var image: String?
    var name: String?
    var itemDescritpion: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let baseURL = "http://cdn.dota2.com/apps/dota2/images/items/"
        var photoURL = name!.lowercased()
        
        switch photoURL {
        case "blink dagger":
            photoURL = "blink_lg.png"
        default:
            photoURL = photoURL.replacingOccurrences(of: " ", with: "_") + "_lg.png"
        }
        
        let url = URL(string: baseURL + photoURL)
        imageView.kf.setImage(with: url)
        
        nameLabel.text = name
        nameLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.text = itemDescritpion
        
    }

}
