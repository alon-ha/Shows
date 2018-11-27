//  
//  AboutCoordinator.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift

class AboutCoordinator: BaseCoordinator<Void> {

    fileprivate let router: Routering

    init(router: Routering) {
        self.router = router
    }
    
    override func start(deepLinkOptions: DeepLinkOptions? = nil) -> Observable<Void> {
        let aboutVM: AboutViewModeling = AboutViewModel()
        let aboutVC = AboutVC(viewModel: aboutVM)
        let vcPopped = PublishSubject<Void>()

        router.push(aboutVC,
                    animated: true,
                    completion: vcPopped)

        return vcPopped
            .asObservable()
    }
}
