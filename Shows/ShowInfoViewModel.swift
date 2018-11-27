//  
//  ShowInfoViewModel.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

protocol ShowInfoViewModelingInputs {
    
}

protocol ShowInfoViewModelingOutputs {
    var title: String { get }
    var imageURL: URL { get }
    var rating: String { get }
    var genres: String { get }
}

protocol ShowInfoViewModeling {
    var inputs: ShowInfoViewModelingInputs { get }
    var outputs: ShowInfoViewModelingOutputs { get }
}

class ShowInfoViewModel: ShowInfoViewModeling, ShowInfoViewModelingInputs, ShowInfoViewModelingOutputs {
    var inputs: ShowInfoViewModelingInputs { return self }
    var outputs: ShowInfoViewModelingOutputs { return self }

    fileprivate let showModel: ShowModel

    init(showModel: ShowModel) {
        self.showModel = showModel
    }

    lazy var title: String = {
        return showModel.name
    }()

    lazy var imageURL: URL = {
        return showModel.image.imageURL
    }()

    lazy var rating: String = {
        guard let rate = showModel.rating.rate else {
            return NSLocalizedString("RatingUnavailable", comment:"")
        }
        return "\(NSLocalizedString("Rating", comment:"")): \(rate)"
    }()

    lazy var genres: String = {
        guard !showModel.genres.isEmpty else {
            return NSLocalizedString("UnknownGenres", comment:"")
        }

        let genresText = showModel.genres.joined(separator: ", ")
        let genresTitle = NSLocalizedString("Genres", comment:"")

        return "\(genresTitle): \(genresText)"
    }()
}
