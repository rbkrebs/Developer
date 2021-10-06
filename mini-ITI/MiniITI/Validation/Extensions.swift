//
//  Extensions.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 06/10/21.
//

import Foundation


// extension só pra brincar
extension ClosedRange where Bound == Int{
    
    var agenciaRandomica : String {
        return String(Int.random(in: self))
    }
    
}

