//
//  DataSource.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 14/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension HeroVC {
    
    func fetchHeroData() {
        
        CustomLoader.instance.showLoaderView()
        
        DispatchQueue.main.async {
            Alamofire.request("https://api.stratz.com/api/v1/Hero").responseJSON(completionHandler:
                { (response) in
                    
                    CustomLoader.instance.hideLoaderView()
                
                    switch response.result {
                    case .success(let value):
                    
                        
                    let json = JSON(value)
                    //let data = json[]
                    for i in 1..<json.count {
                        
                        let heroName = json[String(i)]["displayName"].stringValue
                        let heroPhoto = heroName
                        let attackType = json[String(i)]["stat"]["attackType"].stringValue
                        let startingArmor = json[String(i)]["stat"]["startingArmor"].floatValue
                        let startingDamageMin = json[String(i)]["stat"]["startingDamageMin"].intValue
                        let startingDamageMax = json[String(i)]["stat"]["startingDamageMax"].intValue
                        let primaryAttribute = json[String(i)]["stat"]["primaryAttribute"].stringValue
                        let strengthBase = json[String(i)]["stat"]["strengthBase"].intValue
                        let strengthGain = json[String(i)]["stat"]["strengthGain"].floatValue
                        let intelligenceBase = json[String(i)]["stat"]["intelligenceBase"].intValue
                        let intelligenceGain = json[String(i)]["stat"]["intelligenceGain"].floatValue
                        let agilityBase = json[String(i)]["stat"]["agilityBase"].intValue
                        let agilityGain = json[String(i)]["stat"]["agilityGain"].floatValue
                        let moveSpeed = json[String(i)]["stat"]["moveSpeed"].intValue
                        let bio = json[String(i)]["language"][0]["bio"].stringValue
                        print(bio)
                        
                        if !heroName.isEmpty {
                        
                            let hero = Hero(heroName: heroName, heroPhoto: heroPhoto , attackType: attackType, startingArmor: startingArmor, startingDamageMin: startingDamageMin, startingDamageMax: startingDamageMax, primaryAttribute: primaryAttribute, strengthBase: strengthBase, strengthGain: strengthGain, intelligenceBase: intelligenceBase, intelligenceGain: intelligenceGain, agilityBase: agilityBase, agilityGain: agilityGain, moveSpeed: moveSpeed, bio: bio)
                        
                            self.heroData.append(hero)
                            self.currentHeroes = self.heroData
                        }
                        
                    }
                    self.collectionView.reloadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    }
                    
            })
        }
    }
     
}
