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

    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

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

        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        let scrollViewInsideLayout = mainScrollView.contentLayoutGuide

        scrollViewInsideLayout.snp.makeConstraints { make in
            make.width.equalTo(mainScrollView.snp.width)
        }

        mainScrollView.addSubview(imgViewShow)
        imgViewShow.snp.makeConstraints { make in
            make.leading.equalTo(scrollViewInsideLayout).offset(Metrics.padding)
            make.trailing.equalTo(scrollViewInsideLayout).offset(-Metrics.padding)
            make.centerX.equalTo(scrollViewInsideLayout)
            make.top.equalTo(scrollViewInsideLayout).offset(Metrics.padding)
        }

        mainScrollView.addSubview(lblRating)
        lblRating.snp.makeConstraints { make in
            make.top.equalTo(imgViewShow.snp.bottom).offset(Metrics.padding)
            make.leading.equalTo(scrollViewInsideLayout).offset(Metrics.padding)
            make.trailing.lessThanOrEqualTo(scrollViewInsideLayout).offset(-Metrics.padding)
        }

        mainScrollView.addSubview(lblGenres)
        lblGenres.snp.makeConstraints { make in
            make.top.equalTo(lblRating.snp.bottom).offset(Metrics.padding)
            make.leading.equalTo(scrollViewInsideLayout).offset(Metrics.padding)
            make.trailing.lessThanOrEqualTo(scrollViewInsideLayout).offset(-Metrics.padding)
            make.bottom.lessThanOrEqualTo(scrollViewInsideLayout).offset(-Metrics.padding)
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



