//  
//  Reusable+IndentifierName.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import UIKit

protocol IdentifierCell {
    static var identifierName: String { get }
}

extension IdentifierCell where Self: UIView {
    static var identifierName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: IdentifierCell {}
extension UICollectionReusableView: IdentifierCell {}
