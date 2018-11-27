//
//  ShowsEndpoint.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum ShowsEndpoint: Endpoint {
    case fetchShows

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .fetchShows:
            return .get
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .fetchShows:
            return "/shows"
        }
    }

    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .fetchShows:
            return nil
        }
    }
}

class ShowsAPI: NetworkAPI {
    func fetchShows() -> ResponseType<[ShowModel]> {
        let requestConfigure = request(for: ShowsEndpoint.fetchShows)
        return performRequest(route: requestConfigure)
    }
}
