//
//  ItemVC.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 16/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ItemVC: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var dotaItemData: [DotaItem] = []
    var currentDotaItems = [DotaItem]()
    var sections = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        CustomLoader.instance.setAlpha = 0.2
//        CustomLoader.instance.gifName = "demo2"
//        CustomLoader.instance.viewColor = UIColor.gray
        
        let width = view.frame.size.width / 4
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionHeadersPinToVisibleBounds = true
        fetchDotaItemData()

    }

}




