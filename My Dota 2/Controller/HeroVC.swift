//
//  HeroVC.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 16/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HeroVC: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    var heroData: [Hero] = []
    var currentHeroes = [Hero]()
    var sections = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomLoader.instance.setAlpha = 0.2
        CustomLoader.instance.gifName = "demo2"
        CustomLoader.instance.viewColor = UIColor.gray
        
        let width = view.frame.size.width / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionHeadersPinToVisibleBounds = true
        fetchHeroData()
     
    }
    
}

