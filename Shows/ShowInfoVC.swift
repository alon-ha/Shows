//
//  ShowInfoVC.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import UIKit
import SnapKit

class ShowInfoVC: UIViewController {

    fileprivate struct Metrics {
        static let padding: CGFloat = 24
    }

    fileprivate let viewModel: ShowInfoViewModeling

    fileprivate lazy var imgViewShow: UIImageView = {
        return UIImageView()
            .contentMode(.scaleAspectFit)
    }()

    fileprivate var lblRating: UILabel = {
        return UILabel()
            .font(FontBook.paragraph)
            .textColor(ColorPalette.darkGrey)
    }()

    fileprivate var lblGenres: UILabel = {
        return UILabel()
            .font(FontBook.paragraph)
            .textColor(ColorPalette.darkGrey)
            .numberOfLines(0)
    }()

    init(viewModel: ShowInfoViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureViews()
    }
}

fileprivate extension ShowInfoVC {
    func setupViews() {
        view.backgroundColor = .white

        view.addSubview(imgViewShow)
        imgViewShow.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Metrics.padding)
            make.trailing.equalToSuperview().offset(-Metrics.padding)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Metrics.padding)
        }

        view.addSubview(lblRating)
        lblRating.snp.makeConstraints { make in
            make.top.equalTo(imgViewShow.snp.bottom).offset(Metrics.padding)
            make.leading.equalToSuperview().offset(Metrics.padding)
            make.trailing.lessThanOrEqualToSuperview().offset(-Metrics.padding)
        }

        view.addSubview(lblGenres)
        lblGenres.snp.makeConstraints { make in
            make.top.equalTo(lblRating.snp.bottom).offset(Metrics.padding)
            make.leading.equalToSuperview().offset(Metrics.padding)
            make.trailing.lessThanOrEqualToSuperview().offset(-Metrics.padding)
        }
    }

    func configureViews() {
        title = viewModel.outputs.title
        imgViewShow.kf.setImage(with: viewModel.outputs.imageURL,
                                placeholder: UIImage(named: "show_placeholder"))
        lblRating.text = viewModel.outputs.rating
        lblGenres.text = viewModel.outputs.genres
    }
}



