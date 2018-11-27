//
//  Environment.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

protocol EnvironmentProtocol {
    var scheme: String { get }
    var domain: String { get }
    var baseURL: URL { get }
}

class Environment: EnvironmentProtocol {
    let scheme: String
    let domain: String

    static var currentEnvironment: EnvironmentProtocol!
    static var production = Environment(scheme: "http", domain: "api.tvmaze.com")

    static func set(environment: EnvironmentProtocol) {
        currentEnvironment = environment
    }

    init(scheme: String, domain: String) {
        self.scheme = scheme
        self.domain = domain
    }

    lazy var baseURL: URL = {
        let urlString = "\(scheme)://\(domain)"
        return URL(string: urlString)!
    }()
}
