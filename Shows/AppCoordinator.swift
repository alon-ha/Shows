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
    fileprivate var router: Routering!
    init(window: UIWindow) {
        self.window = window
    }

    override func start(deepLinkOptions: DeepLinkOptions? = nil) -> Observable<Void> {
        // We colud have done some initial logic for example when the app start

        let navigation = UINavigationController()
        window.rootViewController = navigation
        router = Router(navigationController: navigation)

        let showsCoordinator = ShowsCoordinator(router: router)

        return coordinate(to: showsCoordinator)
    }
}
