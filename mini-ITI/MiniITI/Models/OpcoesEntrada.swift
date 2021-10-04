//
//  OpcoesEntrada.swift
//  mini-ITI
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import Foundation

enum OpcoesEntrada: Int, CaseIterable{
    case cria = 1
    case login = 2
    case sair = 3
    
    var description: String{
        switch self{
        case .cria: return "1 - Entrar"
        case .login: return "2 - Criar cadastro"
        case .sair: return "3 - Sair do app"
        }
    }
    
    static func listaOpcoes(){
        OpcoesEntrada.allCases.forEach{print($0.description)}
    }
}
