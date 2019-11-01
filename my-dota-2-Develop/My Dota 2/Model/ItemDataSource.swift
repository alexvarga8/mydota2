//
////
////  DataSource.swift
////  My Dota 2
////
////  Created by Alexandru Varga on 14/10/2019.
////  Copyright © 2019 Alexandru Varga. All rights reserved.
////
//
import UIKit
import Alamofire
import SwiftyJSON

extension ItemVC {
    
    func fetchDotaItemData() {
        
        self.showSpinner(onView: self.view)
        //CustomLoader.instance.showLoaderView()
        
        DispatchQueue.main.async {
            Alamofire.request("https://api.stratz.com/api/v1/Item").responseJSON(completionHandler:
                { (response) in
                    
                    self.removeSpinner()
                    //CustomLoader.instance.hideLoaderView()
                    
                    
                    switch response.result {
                    case .success(let value):
                    
                    let json = JSON(value)
                    for i in 1..<json.count {
                        
                        let itemName = json[String(i)]["displayName"].stringValue
                        let itemPhoto = json[String(i)]["image"].stringValue
                        let itemDescription = json[String(i)]["language"][0]["lore"][0].stringValue
                        let needsComponents = json[String(i)]["stat"]["needsComponents"].boolValue
                        let itemIndex = json[String(i)]["id"].stringValue
                        let isRecipe = json[String(i)]["stat"]["isRecipe"].boolValue
                        let itemCosts = json[String(i)]["stat"]["cost"].intValue
                        if !isRecipe && !itemName.contains("Recipe") && !itemIndex.isEmpty {
                            let dotaItem = DotaItem(itemName: itemName, itemPhoto: itemPhoto, itemDescription: itemDescription, needsComponents: needsComponents, itemIndex: itemIndex, itemCosts: itemCosts)
                            self.dotaItemData.append(dotaItem)
                            self.currentDotaItems = self.dotaItemData
                            print(dotaItem.itemName)
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
