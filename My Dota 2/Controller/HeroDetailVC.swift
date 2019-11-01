//
//  HeroDetailVC.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 17/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit
import Kingfisher

class HeroDetailVC: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var attackTypeLabel: UILabel!
    @IBOutlet var intelligenceLabel: UILabel!
    @IBOutlet var agilityLabel: UILabel!
    @IBOutlet var strengthLabel: UILabel!
    @IBOutlet var attackLabel: UILabel!
    @IBOutlet var movementLabel: UILabel!
    @IBOutlet var armorLabel: UILabel!
    @IBOutlet var bioTextView: UITextView!
    @IBOutlet var intelligenceImage: UIImageView!
    @IBOutlet var agilityImage: UIImageView!
    @IBOutlet var strengthImage: UIImageView!
    
    var image: String?
    var name: String?
    var attribute: String?
    var attackType: String?
    var intelligenceBase: Int?
    var intelligenceGain: Float?
    var agilityBase: Int?
    var agilityGain: Float?
    var strengthBase: Int?
    var strengthGain: Float?
    var startingDamageMin: Int?
    var startingDamageMax: Int?
    var moveSpeed: Int?
    var startingArmor: Float?
    var bio: String?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bioTextView.contentOffset = .zero
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 15.0
        
        let baseURL = "http://cdn.dota2.com/apps/dota2/images/heroes/"
        var photoURL = name!.lowercased()
        switch photoURL {
        case "anti-mage":
            photoURL = "antimage_full.png"
        case "shadow fiend":
            photoURL = "nevermore_full.png"
        case "vengeful spirit":
            photoURL = "vengefulspirit_full.png"
        case "windranger":
            photoURL = "windrunner_full.png"
        case "zeus":
            photoURL = "zuus_full.png"
        case "necrophos":
            photoURL = "necrolyte_full.png"
        case "queen of pain":
            photoURL = "queenofpain_full.png"
        case "wraith king":
            photoURL = "skeleton_king_full.png"
        case "clockwerk":
            photoURL = "rattletrap_full.png"
        case "nature's prophet":
            photoURL = "furion_full.png"
        case "lifestealer":
            photoURL = "life_stealer_full.png"
        case "doom":
            photoURL = "doom_bringer_full.png"
        case "outworld devourer":
            photoURL = "obsidian_destroyer_full.png"
        case "treant protector":
            photoURL = "treant_full.png"
        case "io":
            photoURL = "wisp_full.png"
        case "centaur warrunner":
            photoURL = "centaur_full.png"
        case "magnus":
            photoURL = "magnataur_full.png"
        case "timbersaw":
            photoURL = "shredder_full.png"
        case "underlord":
            photoURL = "abyssal_underlord_full.png"
        default:
            photoURL = photoURL.replacingOccurrences(of: " ", with: "_") + "_full.png"
        }
        
        let url = URL(string: baseURL + photoURL)
        imageView.kf.setImage(with: url)
        
        nameLabel.text = name
        
        if attribute == "agi" {
            agilityImage.layer.borderColor = UIColor(red: 101.0, green: 255.0, blue: 0.0, alpha: 1.0).cgColor
            agilityImage.layer.cornerRadius = 18.0
            agilityImage.contentMode = .scaleAspectFit
            agilityImage.layer.borderWidth = 2
        } else if attribute == "int" {
            intelligenceImage.layer.borderColor = UIColor(red: 101.0, green: 255.0, blue: 0.0, alpha: 1.0).cgColor
            intelligenceImage.layer.cornerRadius = 18.0
            intelligenceImage.contentMode = .scaleAspectFit
            intelligenceImage.layer.borderWidth = 2
        } else if attribute == "str" {
            strengthImage.layer.borderColor = UIColor(red: 101.0, green: 255.0, blue: 0.0, alpha: 1.0).cgColor
            strengthImage.layer.cornerRadius = 18.0
            strengthImage.contentMode = .scaleAspectFit
            strengthImage.layer.borderWidth = 2
        }
        
        attackTypeLabel.text = attackType
        armorLabel.text = String(startingArmor!)
        attackLabel.text = String(startingDamageMin!) + " - " + String(startingDamageMax!)
        strengthLabel.text = String(strengthBase!) + " + " + String(strengthGain!)
        agilityLabel.text = String(agilityBase!) + " + " + String(agilityGain!)
        intelligenceLabel.text = String(intelligenceBase!) + " + " + String(intelligenceGain!)
        movementLabel.text = String(moveSpeed!)
        bioTextView.text = bio!

    }
    
}
