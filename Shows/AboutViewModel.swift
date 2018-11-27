//  
//  AboutViewModel.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation

protocol AboutViewModelingInputs {
    
}

protocol AboutViewModelingOutputs {
    
}

protocol AboutViewModeling {
    var inputs: AboutViewModelingInputs { get }
    var outputs: AboutViewModelingOutputs { get }
}

class AboutViewModel: AboutViewModeling, AboutViewModelingInputs, AboutViewModelingOutputs {
    var inputs: AboutViewModelingInputs { return self }
    var outputs: AboutViewModelingOutputs { return self }
    
}
