//
//  UIColor.swift
//  Weather
//
//  02/12/2018.
//  Copyright © 2019 SCRM. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     * Get the UIColor value from hex
     *
     * - parameters:
     *     - hex: the hex value to transform
     */
    public class func colorWithHex(hex:String) -> UIColor {
        return UIColor.colorWithHex(hex: hex, alpha: 1.0)
    }
    
    /**
     * Get the UIColor value from hex and alpha
     *
     * - parameters:
     *     - hex: the hex value to transform
     *     - alpha: the alpha value for the color
     */
    public class func colorWithHex(hex:String, alpha:CGFloat) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    public class func dodgerBlue() -> UIColor {
        return UIColor.dodgerBlue(alpha: 1.0)
    }
    
    public class func dodgerBlue(alpha : CGFloat) -> UIColor {
        return UIColor.colorWithHex(hex: "#2F91FF", alpha: alpha)
    }
    
    public class func weatherBlack() -> UIColor {
        return UIColor.weatherBlack(alpha: 1.0)
    }
    
    public class func weatherBlack(alpha : CGFloat) -> UIColor {
        return UIColor.colorWithHex(hex: "#333333", alpha: alpha)
    }
    
}
