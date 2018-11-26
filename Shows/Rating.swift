//
//  Rating.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

struct Rating: Codable {
    let rate: Double

    private enum CodingKeys: String, CodingKey {
        case rate = "average"
    }
}
