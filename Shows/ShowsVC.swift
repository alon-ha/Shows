//
//  ShowsVC.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class ShowsVC: UIViewController {
    fileprivate let viewModel: ShowsViewModeling
    fileprivate let disposeBag = DisposeBag()

    fileprivate lazy var showsTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = ShowCell.Metrics.height
        tableView.register(cellClass: ShowCell.self)
        return tableView
    }()

    init(viewModel: ShowsViewModeling = ShowsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupObservers()
        viewModel.inputs.loadShows.onNext()
    }
}

fileprivate extension ShowsVC {
    func setupViews() {
        view.backgroundColor = .white

        view.addSubview(showsTableView)
        showsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupObservers() {
        viewModel.outputs.showsCellsViewModels
            .bind(to: showsTableView.rx.items(cellIdentifier: ShowCell.identifierName,
                                              cellType: ShowCell.self)) { _, viewModel, cell in
                cell.configure(with: viewModel)
            }
            .disposed(by: disposeBag)
    }
}


