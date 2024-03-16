//
//  Colors.swift
//  fhlTracker
//
//  Created by Jose Rivera on 15/03/24.
//

import UIKit
class ColorManager {
    static func getColor(value: Int) -> UIColor {
        if value == 0 {
            return UIColor(named: "lightGrey") ?? UIColor.lightGray
        } else if  value == 1 {
            return UIColor(named: "grass") ?? UIColor.green
        } else if value == 2 {
            return UIColor(named: "yellow") ?? UIColor.orange
        }else if value == 3 {
            return UIColor(named: "red") ?? UIColor.red
        } else if value == 4 {
            return UIColor(named: "black") ?? UIColor.black
        } else {
            return UIColor(named: "lightGrey") ?? UIColor.lightGray
        }
    }
}

extension UIColor {
     @objc class var darkBlack: UIColor {
        return UIColor(named: "darkGray") ?? UIColor.darkGray
    }
}

func hexStringToUIColor (hex: String) -> UIColor {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if cString.hasPrefix("#") {
        cString.remove(at: cString.startIndex)
    }

    if cString.count != 6 {
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
