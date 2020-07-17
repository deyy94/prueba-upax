//
//  OptionsDetailPresenter.swift
//  Prueba
//
//  Created by David Guillermo Robles Sánchez on 16/07/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation
import UIKit

protocol OptionsDetailView: NSObjectProtocol
{
    func setOptions(options: [Options] )
    func getImage() -> UIImage
    
}
class OptionsDetailPresenter {
    weak private var optionsView: OptionsDetailView?
    
    init() {
        
    }
    func attachView(view: OptionsDetailView){
        optionsView = view
    }
    func getOptions(option: [Options])
    {
        print("llegue aqui")
        self.optionsView?.setOptions(options: option)
    }
   
    
}

