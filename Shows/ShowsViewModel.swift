//  
//  ShowsViewModel.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift

protocol ShowsViewModelingInputs {
    var loadShows: PublishSubject<Void> { get }
}

protocol ShowsViewModelingOutputs {
    var showsCellsViewModels: Observable<[ShowCellViewModeling]> { get }
}

protocol ShowsViewModeling {
    var inputs: ShowsViewModelingInputs { get }
    var outputs: ShowsViewModelingOutputs { get }
}

class ShowsViewModel: ShowsViewModeling, ShowsViewModelingInputs, ShowsViewModelingOutputs {
    var inputs: ShowsViewModelingInputs { return self }
    var outputs: ShowsViewModelingOutputs { return self }

    fileprivate let disposeBag = DisposeBag()
    fileprivate let network: ShowsNetworking

    init (network: ShowsNetworking) {
        self.network = network
        setupObservers()
    }

    var loadShows = PublishSubject<Void>()

    var _showsCellsViewModels = BehaviorSubject<[ShowCellViewModeling]?>(value: nil)
    var showsCellsViewModels: Observable<[ShowCellViewModeling]> {
        return _showsCellsViewModels
            .asObservable()
            .unwrap()
    }
}

fileprivate extension ShowsViewModel {
    func setupObservers() {
        loadShows
            .flatMapLatest { [weak self] _ -> Observable<[ShowModel]> in
                return self?.network.fetchShows() ?? .empty()
            }
            .map { shows -> [ShowCellViewModeling] in
                return shows.map { ShowCellViewModel(showModel: $0) }
            }
            .subscribe(onNext: { [weak self] viewModels in
                self?._showsCellsViewModels.onNext(viewModels)
            })
            .disposed(by: disposeBag)
    }
}
