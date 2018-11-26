//  
//  FontBook.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import UIKit

public struct FontBook {
    public static let primaryHeading = font(with: .regular, size: 30)
    public static let primaryHeadingBold = font(with: .bold, size: 30)
    public static let primaryHeadingMedium = font(with: .medium, size: 30)
    public static let primaryHeadingLight = font(with: .light, size: 30)
    
    public static let mainHeading = font(with: .regular, size: 24)
    public static let mainHeadingBold = font(with: .bold, size: 24)
    public static let mainHeadingMedium = font(with: .medium, size: 24)
    public static let mainHeadingLight = font(with: .light, size: 24)
    
    public static let secondaryHeading = font(with: .regular, size: 20)
    public static let secondaryHeadingMedium = font(with: .medium, size: 20)
    public static let secondaryHeadingLight = font(with: .light, size: 20)
    
    public static let paragraph = font(with: .regular, size: 16)
    public static let paragraphMedium = font(with: .medium, size: 16)
    public static let paragraphLight = font(with: .light, size: 16)
    
    public static let helper = font(with: .regular, size: 14)
    public static let helperMedium = font(with: .medium, size: 14)
    public static let helperLight = font(with: .light, size: 14)
    
    fileprivate enum FontType {
        case regular, medium, bold, light
        
        var fontName: String {
            switch self {
            case .regular:
                return "HelveticaNeue"
            case .medium:
                return "HelveticaNeue-Medium"
            case .bold:
                return "HelveticaNeue-Bold"
            case .light:
                return "HelveticaNeue-Light"
            }
        }
    }
    
    fileprivate static func font(with type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: type.fontName, size: size)!
    }
}
