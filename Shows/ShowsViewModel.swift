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
    var tapInfo: PublishSubject<Void> { get }
    var tapCellViewModel: PublishSubject<ShowCellViewModeling> { get }
}

protocol ShowsViewModelingOutputs {
    var showsCellsViewModels: Observable<[ShowCellViewModeling]> { get }
    var showMoreDetails: Observable<ShowModel> { get }
    var openAbout: Observable<Void> { get }
    var title: String { get }
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

    init (network: ShowsNetworking = ShowsNetwork()) {
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

    var tapInfo = PublishSubject<Void>()
    var openAbout: Observable<Void> {
        return tapInfo.asObservable()
    }

    var tapCellViewModel = PublishSubject<ShowCellViewModeling>()
    var showMoreDetails: Observable<ShowModel> {
        return tapCellViewModel
            .map { $0.outputs.showModel }
            .asObservable()
    }

    lazy var title: String = {
        return NSLocalizedString("BestShows", comment:"")
    }()
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
