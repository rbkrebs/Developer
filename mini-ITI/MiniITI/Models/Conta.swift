//
//  Conta.swift
//  mini-ITI
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import Foundation

struct Conta: Comparable{
    
    
    static func == (lhs: Conta, rhs: Conta) -> Bool {
        if((lhs.agencia == rhs.agencia) && (lhs.conta == rhs.conta)){
            return true
        }
        return false
    }
    
    static func < (lhs: Conta, rhs: Conta) -> Bool {
        return false
    }
    
    
    var agencia : String = (1000...9999).agenciaRandomica
    let conta : String
    
    init(cpf:String){
        self.conta = agencia+cpf
    }
    
    init(conta: String, agencia: String){
        self.conta = conta
        self.agencia = agencia
    }
    
   
}


