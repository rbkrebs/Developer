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
    case tamanhoMinimo
    case tamanhoMaximo
    
}


extension ValidationError: LocalizedError{
    
    var errorDescription: String?{
        switch self {
        case .cpfInvalido:
            return NSLocalizedString("CPF inválido. Deve conter 11 digitos numéricos", comment: "")
        case .estaEmBranco:
            return NSLocalizedString("Texto em branco. Este campos é obrigatório", comment: "")
            
        case .tamanhoMinimo:
            return NSLocalizedString("Texto muito pequeno.Tamanho mínimo de xx", comment: "")
            
        case .tamanhoMaximo:
            return NSLocalizedString("Texto muito grande. Tamanho máximo de xx", comment: "")
        }
        
        
    }
    
}
