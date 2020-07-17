//
//  OptionsPresenter.swift
//  Prueba
//
//  Created by David Guillermo Robles Sánchez on 16/07/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation
import UIKit


protocol OptionsView: NSObjectProtocol
{
    func setOptions(options: [Options] )
    func setFooter() -> UIView
    func showAlert(mensaje: String)
    
  

}

class OptionsPresenter {
    weak private var optionsView: OptionsView?
    
    init() {
        
    }
    func attachView(view: OptionsView){
        optionsView = view
    }
    func getOptions(){
        
        let ruta = Bundle.main.url(forResource: "options", withExtension: "json")
        let data = try! Data(contentsOf: ruta!)
        let response = try! JSONDecoder().decode([String].self, from: data)
        
        let options = response.map{
            return Options(name: $0, check: false)
        }
        self.optionsView?.setOptions(options: options)
    }
    
}
