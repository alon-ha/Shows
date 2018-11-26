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
    
}

protocol ShowInfoViewModeling {
    var inputs: ShowInfoViewModelingInputs { get }
    var outputs: ShowInfoViewModelingOutputs { get }
}

class ShowInfoViewModel: ShowInfoViewModeling, ShowInfoViewModelingInputs, ShowInfoViewModelingOutputs {
    var inputs: ShowInfoViewModelingInputs { return self }
    var outputs: ShowInfoViewModelingOutputs { return self }
    
}
