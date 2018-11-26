//  
//  ShowInfoCoordinator.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift

class ShowInfoCoordinator: BaseCoordinator<Void> {

    override func start(deepLinkOptions: DeepLinkOptions? = nil) -> Observable<Void> {
        return .never()
    }
}
