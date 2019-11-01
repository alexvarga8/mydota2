//
//  ButtonWithImage.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 14/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit

class ButtonWithImage: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 20.0
        self.tintColor = UIColor.white
    }
    
}
