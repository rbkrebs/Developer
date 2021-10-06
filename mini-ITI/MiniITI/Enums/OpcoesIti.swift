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
    case depositar = 4
    case verSaldo = 5
    case excluirConta = 6
    case sair = 7
    
    var description: String{
        switch self{
        case .transferir: return "1 - Transferir agencia/conta"
        case .pagarPix: return "2 - Pagar / Transferir com PIX"
        case .criarChave: return "3 - Cadastrar chave PIX"
        case .depositar: return "4 - Depositar"
        case .verSaldo: return "5 - Saldo"
        case .excluirConta: return "6 - Excluir conta"
        case .sair: return "7 - Sair"
        }
    }
    
    static func listaOpcoes(){
        OpcoesIti.allCases.forEach{print($0.description)}
    }
}
