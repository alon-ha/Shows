//  
//  ShowsCoordinator.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift

class ShowsCoordinator: BaseCoordinator<Void> {

    fileprivate let router: Routering

    init(router: Routering) {
        self.router = router
    }
    
    override func start(deepLinkOptions: DeepLinkOptions? = nil) -> Observable<Void> {
        let showsVM: ShowsViewModeling = ShowsViewModel()
        let showsVC = ShowsVC(viewModel: showsVM)
        router.setRoot(showsVC)

        let deepLinkToAbout = PublishSubject<Void>()

        let coordinateAbout = Observable.merge(showsVM.outputs.openAbout, deepLinkToAbout.asObservable())
            .flatMap { [weak self] _ -> Observable<Void> in
                guard let self = self else { return .empty() }
                let aboutCoordinator = AboutCoordinator(router: self.router)
                return self.coordinate(to: aboutCoordinator)
            }

        let coordinateShowInfo = showsVM.outputs.showMoreDetails
            .flatMap { [weak self] showModel -> Observable<Void> in
                guard let self = self else { return .empty() }
                let showInfoCoordinator = ShowInfoCoordinator(router: self.router,
                                                           showModel: showModel)
                return self.coordinate(to: showInfoCoordinator)
        }

        if let deepLink = deepLinkOptions {
            switch deepLink {
            case .about:
                deepLinkToAbout.onNext()
            }
        }

        return Observable.merge(coordinateAbout, coordinateShowInfo)
            .flatMap { _ -> Observable<Void> in
                // We always showing the shows screen, that's why we return never here.
                return .never()
            }
    }
}
