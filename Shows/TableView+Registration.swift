//
//  TableView+Registration.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import UIKit

private struct AssociatedCells {
    static var registeredCellsIdentifiers = "registeredCellsIdentifiers"
}

extension UITableView {
    func dequeueReusableCellAndReigsterIfNeeded<T: UITableViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
        registerIfNeeded(cellClass: cellClass)
        let cell = self.dequeueReusableCell(withIdentifier: cellClass.identifierName, for: indexPath) as! T
        return cell
    }

    func register<T: UITableViewCell>(cellClass: T.Type = T.self) {
        let bundle = Bundle(for: cellClass.self)
        if bundle.path(forResource: cellClass.identifierName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellClass.identifierName, bundle: bundle)
            register(nib, forCellReuseIdentifier: cellClass.identifierName)
        } else {
            register(cellClass.self, forCellReuseIdentifier: cellClass.identifierName)
        }
    }
}

fileprivate extension UITableView {
    func registerIfNeeded<T: UITableViewCell>(cellClass: T.Type) {
        if registeredCellsIdentifiers.contains(cellClass.identifierName) {
            return
        }
        registeredCellsIdentifiers.insert(cellClass.identifierName)
        self.register(cellClass: cellClass)
    }

    var registeredCellsIdentifiers: Set<String> {
        get {
            // Check if it was already set
            if let registered = objc_getAssociatedObject(self, &AssociatedCells.registeredCellsIdentifiers) as? Set<String> {
                return registered
            }

            // Create set
            let registered = Set<String>()
            return registered
        }
        set { objc_setAssociatedObject(self, &AssociatedCells.registeredCellsIdentifiers,
                                       newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

