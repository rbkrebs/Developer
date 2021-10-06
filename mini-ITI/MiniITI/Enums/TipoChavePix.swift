//
//  TipoChavePix.swift
//  mini-ITI
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import Foundation

enum TipoChavePix: Int, CaseIterable{
    
    case email = 1
    case cpf = 2
    
    var description: String{
        switch self{
        case .email: return "1 - E-mail"
        case .cpf: return "2 - CPF"
       
        }
    }
    
    static func listaOpcoes(){
        TipoChavePix.allCases.forEach{print($0.description)}
    }
}
