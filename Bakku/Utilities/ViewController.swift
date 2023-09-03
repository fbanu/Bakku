//
//  ViewController.swift
//  Bakku
//
//  Created by Farheen Banu on 9/1/23.
//

import UIKit
import Foundation

protocol StoryboardInstantiable where Self: UIViewController {
    static var storyboardIdentifier: UIStoryboard { get set }
}

class ViewController<T: StoryboardInstantiable> {
    
    class func instance() -> T {
        
        let controller = T.storyboardIdentifier.instantiateViewController(withIdentifier: T.storyboardIdentifier.description) as! T
        return controller
    }
}
