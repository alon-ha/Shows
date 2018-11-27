//
//  HTTPHeaderField.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import Alamofire

struct HTTPHeaderField {
    static let contentType = "Content-Type"
    static let acceptType = "Accept"
}

struct ContentType {
    static let json = "application/json"
}

class ContentTypeRequestMiddleware: RequestMiddleware {
    func process(request: URLRequest) -> URLRequest {
        guard let method = request.httpMethod,
            method != HTTPMethod.get.rawValue else {
                return request
        }

        var newRequest = request
        newRequest.setValue(ContentType.json, forHTTPHeaderField: HTTPHeaderField.acceptType)
        newRequest.setValue(ContentType.json, forHTTPHeaderField: HTTPHeaderField.contentType)
        return newRequest
    }
}
