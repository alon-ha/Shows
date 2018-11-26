//  
//  ColorPalette.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import UIKit

public struct ColorPalette {
    public static var blue = UIColor(r: 0, g: 161, b: 229)
    public static var blackish = UIColor(r: 51, g: 51, b: 51)
    public static var darkGrey = UIColor(r: 128, g: 128, b: 128)
    public static var basicGrey = UIColor(r: 196, g: 196, b: 196)
    public static var midGrey = UIColor(r: 225, g: 225, b: 225)
    public static var lightGrey = UIColor(r: 241, g: 241, b: 241)
    public static var extraLightGrey = UIColor(r: 247, g: 247, b: 247)
    public static var red = UIColor(r: 228, g: 66, b: 88)
    public static var orange = UIColor(r: 255, g: 172, b: 44)
    public static var green = UIColor(r: 0, g: 202, b: 114)
    public static var purple = UIColor(r: 163, g: 88, b: 223)
    public static var pink = UIColor(r: 246, g: 95, b: 124)
    public static var highlightBlue = UIColor(r: 204, g: 233, b: 255)
}

private extension UIColor {
    convenience init(r: UInt32, g: UInt32, b: UInt32) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1)
    }
}
