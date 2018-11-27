//
//  AboutVC.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import UIKit
import SnapKit

class AboutVC: UIViewController {

    fileprivate struct Metrics {
        static let padding: CGFloat = 16
    }

    fileprivate let viewModel: AboutViewModeling

    fileprivate var txtViewAbout: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()

    fileprivate var lblAllRights: UILabel = {
        return UILabel()
            .font(FontBook.helperMedium)
            .textColor(ColorPalette.darkGrey)
            .textAlignment(.center)
    }()

    init(viewModel: AboutViewModeling = AboutViewModel()) {
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

fileprivate extension AboutVC {
    func setupViews() {
        view.backgroundColor = .white

        view.addSubview(lblAllRights)
        lblAllRights.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(Metrics.padding)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-Metrics.padding)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-Metrics.padding)
        }

        view.addSubview(txtViewAbout)
        txtViewAbout.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(Metrics.padding)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-Metrics.padding)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Metrics.padding)
            make.bottom.equalTo(lblAllRights.snp.top).offset(-Metrics.padding)
        }
    }

    func configureViews() {
        title = viewModel.outputs.title
        lblAllRights.text = viewModel.outputs.allRightsText
        txtViewAbout.attributedText = viewModel.outputs.aboutText
    }
}
