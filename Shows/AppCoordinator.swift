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
        initialSetup()

        let showsCoordinator = ShowsCoordinator(router: router)

        return coordinate(to: showsCoordinator)
    }
}

fileprivate extension AppCoordinator {
    func initialSetup() {
        // In this app there is only one environment, but here we could set up another environment for example
        Environment.set(environment: Environment.production)

        let navigation = UINavigationController()
        let navBar = navigation.navigationBar
        navBar.isTranslucent = false
        navBar.tintColor = ColorPalette.blackish
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorPalette.blackish]
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        router = Router(navigationController: navigation)
    }
}
