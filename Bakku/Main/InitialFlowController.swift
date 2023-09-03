//
//  InitialFlowController.swift
//  Bakku
//
//  Created by Farheen Banu on 9/3/23.
//

import Foundation
import UIKit

class InitialFlowController {
    
    private let window: UIWindow?
        
    init() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.window = delegate.window
        self.initLandingPageVC()
    }
    
    func initLandingPageVC() {
        let viewController = LandingPageVC()
        let controller = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }
    
    func setAsRootViewController(controller: UIViewController) {
        self.window?.rootViewController = controller
    }
}
