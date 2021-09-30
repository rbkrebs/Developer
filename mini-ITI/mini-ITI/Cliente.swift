//
//  Cliente.swift
//  mini-ITI
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import Foundation


class Cliente{
    
    
    let nome: String
    let cpf: String
    let telefone: String
    let endereco: String
    let ocupacao: String
    let renda: String
    let senha: String
    let agencia: String = "1234"
    let conta: String
    private(set) var saldo: Double = 0
    
    init(
        nome: String,
        cpf: String,
        telefone: String,
        endereco: String,
        ocupacao: String,
        renda: String,
        senha: String
    ){
        self.nome = nome
        self.cpf = cpf
        self.telefone = telefone
        self.endereco = endereco
        self.ocupacao = ocupacao
        self.renda = renda
        self.senha = senha
        self.conta = agencia+cpf
    }
    
    func verSaldo() -> String{
        return
        """
            \(self.nome)
            \(self.agencia)
            \(self.conta)
                            
                        
                            \(saldo)
        """
    }
    
    
    
    
    
    
    
}
