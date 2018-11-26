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
    fileprivate let viewModel: ShowInfoViewModeling

    init(viewModel: ShowInfoViewModeling = ShowInfoViewModel()) {
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

fileprivate extension ShowInfoVC {
    func setupViews() {

    }
}



