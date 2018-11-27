//
//  ResponseLogger.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import Alamofire

class ResponseLogger: Logging, ResponseMiddleware {
    func process<T: Any>(response: DataResponse<T>) -> DataResponse<T> {
        if let error = response.error {
            log(output: "Network error: \(error.localizedDescription)")
        } else if let url = response.request?.url{
            log(output: "Network received request: \(url)")
        }

        return response
    }

    func log(output: String) {
        DLog(output)
    }
}

