//
//  OpcoesIti.swift
//  mini-ITI
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import Foundation


enum OpcoesIti: Int, CaseIterable{
    case transferir = 1
    case pagarPix = 2
    case criarChave = 3
    
    var description: String{
        switch self{
        case .transferir: return "1 - Transferir agencia/conta"
        case .pagarPix: return "2 - Pagar / Transferir com PIX"
        case .criarChave: return "3 -  Cadastrar chave PIX"
        }
    }
    
    static func listaOpcoes(){
        OpcoesEntrada.allCases.forEach{print($0.description)}
    }
}
