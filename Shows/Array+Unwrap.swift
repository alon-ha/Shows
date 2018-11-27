//
//  Array+Unwrap.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

extension Array {
    func unwrap<T>() -> [T] where Element == T? {
        return filter { $0 != nil }
            .map { $0! }
    }
}
