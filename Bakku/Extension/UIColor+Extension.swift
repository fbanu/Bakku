//
//  UIColor+Extension.swift
//  Bakku
//
//  Created by Farheen Banu on 9/3/23.
//

import Foundation
import UIKit

extension UIColor {
    
    // swiftlint:disable identifier_name
    public class func from(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    // swiftlint:enable identifier_name
    
    /// Converts Hex format string to UIColor
    ///
    /// - Parameter hex: hexadecimal representation of color. eg, #cccccc
    /// - Returns: UIColor representing the format
    public class func from (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.count) != 6 {
            return UIColor.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
