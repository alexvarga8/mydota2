//
//  CustomButton.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 14/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 20.0
        self.backgroundColor = (UIColor.gray).withAlphaComponent(0.6)
        self.layer.borderWidth = 1.5
        self.tintColor = UIColor.white
    }

}
