//
//  ShowImage.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

struct ShowImage: Codable {
    let imageURL: URL

    private enum CodingKeys: String, CodingKey {
        case imageURL = "medium"
    }
}
