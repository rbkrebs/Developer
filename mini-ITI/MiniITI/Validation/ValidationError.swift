//
//  ValidationError.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 05/10/21.
//

import Foundation


enum ValidationError : Error{
    
    case cpfInvalido
    case estaEmBranco
    
}


extension ValidationError: LocalizedError{
    
    var errorDescription: String?{
        switch self {
        case .cpfInvalido:
            return NSLocalizedString("CPF inválido. Deve conter 11 digitos numéricos", comment: "")
        case .estaEmBranco:
            return NSLocalizedString("Texto em branco. Este campos é obrigatório", comment: "")
        }
        
        
    }
    
}
