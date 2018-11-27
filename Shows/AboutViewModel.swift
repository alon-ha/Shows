//  
//  AboutViewModel.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import UIKit

protocol AboutViewModelingInputs {
    
}

protocol AboutViewModelingOutputs {
    var allRightsText: String { get }
    var aboutText: NSAttributedString { get }
}

protocol AboutViewModeling {
    var inputs: AboutViewModelingInputs { get }
    var outputs: AboutViewModelingOutputs { get }
}

class AboutViewModel: AboutViewModeling, AboutViewModelingInputs, AboutViewModelingOutputs {
    var inputs: AboutViewModelingInputs { return self }
    var outputs: AboutViewModelingOutputs { return self }

    lazy var allRightsText: String = {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        return NSLocalizedString("AllRights", value: "\(year)", comment: "")
    }()

    lazy var aboutText: NSAttributedString = {
        let text = NSLocalizedString("AboutText", comment: "")

        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4

        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: FontBook.secondaryHeadingMedium,
            NSAttributedString.Key.foregroundColor: ColorPalette.blackish,
            NSAttributedString.Key.paragraphStyle: style
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }()
    
}
