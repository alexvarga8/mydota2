//
//  CollectionViewCell.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 15/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit
import Kingfisher

class HeroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    //http://cdn.dota2.com/apps/dota2/images/heroes/antimage_vert.jpg
    


    
    var hero: Hero? {
        didSet {
            if let hero = hero {
                let baseURL = "http://cdn.dota2.com/apps/dota2/images/heroes/"
                var photoURL = hero.heroName.lowercased()
                switch photoURL {
                case "anti-mage":
                    photoURL = "antimage_vert.jpg"
                case "shadow fiend":
                    photoURL = "nevermore_vert.jpg"
                case "vengeful spirit":
                    photoURL = "vengefulspirit_vert.jpg"
                case "windranger":
                    photoURL = "windrunner_vert.jpg"
                case "zeus":
                    photoURL = "zuus_vert.jpg"
                case "necrophos":
                    photoURL = "necrolyte_vert.jpg"
                case "queen of pain":
                    photoURL = "queenofpain_vert.jpg"
                case "wraith king":
                    photoURL = "skeleton_king_vert.jpg"
                case "clockwerk":
                    photoURL = "rattletrap_vert.jpg"
                case "nature's prophet":
                    photoURL = "furion_vert.jpg"
                case "lifestealer":
                    photoURL = "life_stealer_vert.jpg"
                case "doom":
                    photoURL = "doom_bringer_vert.jpg"
                case "outworld devourer":
                    photoURL = "obsidian_destroyer_vert.jpg"
                case "treant protector":
                    photoURL = "treant_vert.jpg"
                case "io":
                    photoURL = "wisp_vert.jpg"
                case "centaur warrunner":
                    photoURL = "centaur_vert.jpg"
                case "magnus":
                    photoURL = "magnataur_vert.jpg"
                case "timbersaw":
                    photoURL = "shredder_vert.jpg"
                case "underlord":
                    photoURL = "abyssal_underlord_vert.jpg"
                default:
                    photoURL = photoURL.replacingOccurrences(of: " ", with: "_") + "_vert.jpg"
                }
                
                nameLabel.adjustsFontSizeToFitWidth = true
                
                let url = URL(string: baseURL + photoURL)
                imageView.kf.setImage(with: url)
                nameLabel.text = hero.heroName
            }
        }
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        nameLabel.text = nil
    }
    
}
