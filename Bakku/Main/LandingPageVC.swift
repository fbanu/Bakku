//
//  LandingPageVC.swift
//  Bakku
//
//  Created by Farheen Banu on 9/3/23.
//

import Foundation
import UIKit

class LandingPageVC: UIViewController {
    
    let newView = UIView()
    let welcomeLabel = UILabel()
    
    override func loadView() {
        newView.backgroundColor = Theme.Color.bgColor
        self.view = newView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeLabel.setupForAutolayout(in: self.view)
        self.welcomeLabel.pinLeadingToLeading(of: self.view, constant: 50)
        self.welcomeLabel.pinTrailingToTrailing(of: self.view, constant: 50)
        self.welcomeLabel.pinTopToTopSafeArea(of: self.view, constant: 50)
        self.welcomeLabel.text = "Welcome"
    }
}
