//
//  ViewController.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 14/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet var startButton: CustomButton!
    
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = startButton.center
        transition.circleColor = startButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = startButton.center
        transition.circleColor = startButton.backgroundColor!
        
        return transition
    }

}


