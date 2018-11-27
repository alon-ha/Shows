//  
//  ShowsNetwork.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift

// We are using this protocol and this class, so if we will change the implementation of the network
// in the future, we will only need to change the implementation of this class, but the view model won't break

protocol ShowsNetworking {
   func fetchShows() -> Observable<[ShowModel]>
}

class ShowsNetwork: ShowsNetworking {
    fileprivate var api: ShowsAPI

    init(api: ShowsAPI = ShowsAPI(environment: Environment.currentEnvironment)) {
        self.api = api
    }

    func fetchShows() -> Observable<[ShowModel]> {
        return api.fetchShows().response
    }
}
