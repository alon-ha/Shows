//
//  Middleware.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import Alamofire

protocol Middleware {}

protocol RequestMiddleware: Middleware {
    func process(request: URLRequest) -> URLRequest
}

protocol ResponseMiddleware: Middleware {
    func process<T: Any>(response: DataResponse<T, AFError>) -> DataResponse<T, AFError>
}
