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
    @IBOutlet var costsLabel: UILabel!
    @IBOutlet var attributesLabel: UILabel!
    
    var image: String?
    var name: String?
    var itemDescritpion: String?
    var needsComponents: Bool?
    var costs: Int?
    var attributes: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 15.0

        let baseURL = "https://steamcdn-a.akamaihd.net/apps/dota2/images/items/"
        let photoURL = image!
        let url = URL(string: baseURL + photoURL)
        
        imageView.kf.setImage(with: url)
        
        if needsComponents! {
            nameLabel.textColor = UIColor.black
        } else if !needsComponents! {
            nameLabel.textColor = UIColor.white
        }
        
        nameLabel.text = name
        nameLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.text = itemDescritpion
        
        costsLabel.text = String(costs!)
        
        attributesLabel.text = attributes?.joined(separator: "\n")
        
    }

}
