//
//  ShowCell.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class ShowCell: UITableViewCell {
    struct Metrics {
        static let height: CGFloat = 60 + (2 * mainAreaInset)
        static let imageSize: CGFloat = 40
        static let imageRadius: CGFloat = 8
        static let horizontalPadding: CGFloat = 12
        static let verticalPadding: CGFloat = 6
        static let mainAreaInset: CGFloat = 12
        static let mainAreaRadius: CGFloat = 8
    }

    fileprivate lazy var mainArea: UIView = {
        let view = UIView()
            .corner(radius: Metrics.mainAreaRadius)
            .backgroundColor(ColorPalette.lightGrey)
        view.apply(shadow: .medium)
        return view
    }()

    fileprivate lazy var imgViewShow: UIImageView = {
        let imgView = UIImageView()
            .contentMode(.scaleAspectFit)
            .corner(radius: Metrics.imageRadius)
        return imgView
    }()

    fileprivate lazy var lblName: UILabel = {
        let lbl = UILabel()
            .font(FontBook.secondaryHeading)
            .textColor(ColorPalette.blackish)
        return lbl
    }()

    fileprivate lazy var lblRating: UILabel = {
        let lbl = UILabel()
            .font(FontBook.paragraph)
            .textColor(ColorPalette.blackish)
        return lbl
    }()

    fileprivate var viewModel: ShowCellViewModeling!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    func configure(with viewModel: ShowCellViewModeling) {
        self.viewModel = viewModel
        configureViews()
    }
}

fileprivate extension ShowCell {
    func setupViews() {
        contentView.addSubview(mainArea)
        mainArea.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Metrics.mainAreaInset)
        }

        mainArea.addSubview(imgViewShow)
        imgViewShow.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(Metrics.imageSize)
            make.leading.equalToSuperview().offset(Metrics.horizontalPadding)
        }

        mainArea.addSubview(lblName)
        lblName.snp.makeConstraints { make in
            make.top.equalTo(imgViewShow)
            make.leading.equalTo(imgViewShow.snp.trailing).offset(Metrics.horizontalPadding)
            make.trailing.lessThanOrEqualToSuperview().offset(-Metrics.horizontalPadding)
        }

        mainArea.addSubview(lblRating)
        lblRating.snp.makeConstraints { make in
            make.top.equalTo(lblName.snp.bottom).offset(Metrics.verticalPadding)
            make.leading.equalTo(lblName)
            make.trailing.lessThanOrEqualToSuperview().offset(-Metrics.horizontalPadding)
        }
    }

    func configureViews() {
        imgViewShow.kf.setImage(with: viewModel.outputs.imageURL,
                                placeholder: UIImage(named: "show_placeholder"))
        lblName.text = viewModel.outputs.name
        lblRating.text = viewModel.outputs.rating
    }
}
