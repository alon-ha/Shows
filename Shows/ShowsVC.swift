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
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(cellClass: ShowCell.self)
        return tableView
    }()

    fileprivate lazy var btnItemAbout: UIBarButtonItem = {
        let infoImage = UIImage(named: "info")
        return UIBarButtonItem(image: infoImage, style: .plain, target: nil, action: nil)
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

        navigationItem.rightBarButtonItem = btnItemAbout
    }

    func setupObservers() {
        title = viewModel.outputs.title

        viewModel.outputs.showsCellsViewModels
            .bind(to: showsTableView.rx.items(cellIdentifier: ShowCell.identifierName,
                                              cellType: ShowCell.self)) { _, viewModel, cell in
                cell.configure(with: viewModel)
            }
            .disposed(by: disposeBag)

        showsTableView.rx.modelSelected(ShowCellViewModeling.self)
            .bind(to: viewModel.inputs.tapCellViewModel)
            .disposed(by: disposeBag)

        btnItemAbout.rx.tap
            .asObservable()
            .bind(to: viewModel.inputs.tapInfo)
            .disposed(by: disposeBag)
    }
}


