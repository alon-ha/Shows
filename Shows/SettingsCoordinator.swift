//  
//  SettingsCoordinator.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift

// This is just an example of how we can retrive a result from a coordinator for the flow of the app
enum SettingsCoordinatorResult {
    case nothingChanged
    case userChangedFontSize
}

class SettingsCoordinator: BaseCoordinator<SettingsCoordinatorResult> {

    override func start(deepLinkOptions: DeepLinkOptions? = nil) -> Observable<SettingsCoordinatorResult> {
        return .never()
    }
}
