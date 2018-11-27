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
    fileprivate let viewModel: AboutViewModeling

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
    }
}

fileprivate extension AboutVC {
    func setupViews() {

    }
}
