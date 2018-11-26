//  
//  Shadowable.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import UIKit

public enum ShadowType {
    case none, low, medium, high
}

public enum ShadowDirection {
    case down, up
}

public protocol Shadowable {
    func apply(shadow type: ShadowType)
    func apply(shadow type: ShadowType, color: UIColor)
    func apply(shadow type: ShadowType, direction: ShadowDirection)
    func apply(shadow type: ShadowType, color: UIColor, direction: ShadowDirection)
}

private extension ShadowType {
    var offset: CGSize {
        switch self {
        case .none: return .zero
        case .low: return CGSize(width: 0, height: 3)
        case .medium: return CGSize(width: 0, height: 5)
        case .high: return CGSize(width: 0, height: 6)
        }
    }
    
    var opacity: Float {
        switch self {
        case .none: return 0
        case .low: return 0.1
        case .medium: return 0.2
        case .high: return 0.2
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .none: return 0
        case .low: return 3
        case .medium: return 6
        case .high: return 10
        }
    }
}

extension UIView: Shadowable {
    public func apply(shadow type: ShadowType) {
        apply(shadow: type, color: ColorPalette.blackish, direction: .down)
    }
    
    public func apply(shadow type: ShadowType, direction: ShadowDirection) {
        apply(shadow: type, color: ColorPalette.blackish, direction: direction)
    }
    
    public func apply(shadow type: ShadowType, color: UIColor) {
        apply(shadow: type, color: color, direction: .down)
    }
    
    public func apply(shadow type: ShadowType, color: UIColor, direction: ShadowDirection) {
        var offset = type.offset
        if direction == .up {
            offset.height *= -1
        }
        layer.shadowColor = color.cgColor
        layer.shadowRadius = type.radius
        layer.shadowOffset = offset
        layer.shadowOpacity = type.opacity
        layer.masksToBounds = type == .none
    }
}
