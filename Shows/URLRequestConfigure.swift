//
//  URLRequestConfigure.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol URLRequestConfiguration: URLRequestConvertible {
    var environment: EnvironmentProtocol { get }
    var endpoint: Endpoint { get }
    func asURLRequest() throws -> URLRequest
}

extension URLRequestConfiguration {
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        let url = try environment.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(endpoint.path))

        // HTTP Method
        urlRequest.httpMethod = endpoint.method.rawValue

        // Timeout in seconds
        urlRequest.timeoutInterval = 10

        // Parameters
        if let parameters = endpoint.parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }
}

struct URLRequestConfigure: URLRequestConfiguration {
    var environment: EnvironmentProtocol
    var endpoint: Endpoint
}
