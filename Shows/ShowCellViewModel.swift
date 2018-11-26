//  
//  ShowCellViewModel.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

protocol ShowCellViewModelingInputs {
    
}

protocol ShowCellViewModelingOutputs {
    var name: String { get }
    var imageURL: URL { get }
    var rating: String { get }
}

protocol ShowCellViewModeling {
    var inputs: ShowCellViewModelingInputs { get }
    var outputs: ShowCellViewModelingOutputs { get }
}

class ShowCellViewModel: ShowCellViewModeling, ShowCellViewModelingInputs, ShowCellViewModelingOutputs {
    var inputs: ShowCellViewModelingInputs { return self }
    var outputs: ShowCellViewModelingOutputs { return self }

    fileprivate let showModel: ShowModel

    init(showModel: ShowModel) {
        self.showModel = showModel
    }

    lazy var name: String = {
        return showModel.name
    }()

    lazy var imageURL: URL = {
        return showModel.image.imageURL
    }()

    lazy var rating: String = {
        return "\(NSLocalizedString("Rating", comment:"")): \(showModel.rating.rate))"
    }()
}
