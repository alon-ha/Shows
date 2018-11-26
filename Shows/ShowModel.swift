//
//  ShowModel.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

typealias Genre = String

struct ShowModel: Codable {
    let id: Int
    let name: String
    let genres: [Genre]
    let rating: Rating
    let language: String
    let image: ShowImage
}
