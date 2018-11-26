//  
//  AppCoordinator.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {

    fileprivate let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start(deepLinkOptions: DeepLinkOptions? = nil) -> Observable<Void> {
        // We colud have done some initial logic for example when the app start

        let showsCoordinator = ShowsCoordinator()

        return coordinate(to: showsCoordinator)
            .flatMap { _ -> Observable<Void> in
                // We return never because the app should never end
                return .never()
            }
    }
}
