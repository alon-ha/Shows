//
//  RequestLogger.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

class RequestLogger: Logging, RequestMiddleware {
    func process(request: URLRequest) -> URLRequest {
        log(output: "Network request: \(request.debugDescription)")
        return request
    }

    func log(output: String) {
        DLog(output)
    }
}
