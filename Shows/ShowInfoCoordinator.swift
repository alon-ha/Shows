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

    fileprivate let router: Routering
    fileprivate let showModel: ShowModel

    init(router: Routering, showModel: ShowModel) {
        self.router = router
        self.showModel = showModel
    }

    override func start(deepLinkOptions: DeepLinkOptions? = nil) -> Observable<Void> {
        let showInfoVM: ShowInfoViewModeling = ShowInfoViewModel(showModel: showModel)
        let showInfoVC = ShowInfoVC(viewModel: showInfoVM)
        let vcPopped = PublishSubject<Void>()

        router.push(showInfoVC,
                    animated: true,
                    completion: vcPopped)
        
        return vcPopped
            .asObservable()
    }
}
