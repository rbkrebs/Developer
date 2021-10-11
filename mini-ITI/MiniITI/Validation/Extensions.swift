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

// Só pra brincar um pouco mais com extensions
extension String{
    
    func ehCpfValido() throws -> Bool {
        
        guard self.count < 9 else {
            throw ValidationError.cpfInvalido
        }
        guard self.map({Int(String($0))!}).enumerated().reduce(0, {(result: Int, nextTuple: (Int, Int)) -> Int in return result + nextTuple.0 * nextTuple.1})%11 <= 1 else {
            throw ValidationError.cpfInvalido
        }
        
        return true
    }
    
    
}

