//  
//  ShowsNetwork.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift

protocol ShowsNetworking {
   func fetchShows() -> Observable<[ShowModel]>
}

class ShowsNetwork: ShowsNetworking {
    func fetchShows() -> Observable<[ShowModel]> {
        return .empty()
    }
}
