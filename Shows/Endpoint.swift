//
//  Endpoint.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import Alamofire

protocol Endpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
