//
//  Cliente.swift
//  mini-ITI
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import Foundation


class Cliente: Comparable{
    
    
    
    
    private let nome: String
    private let cpf: String
    private let telefone: String
    private let endereco: String
    private let ocupacao: String
    private let renda: String
    private let senha: String
    private let conta: Conta
    private(set) var saldo: Double = 0
    static var listaClientes: [Cliente] = []
    private var tipoChavePix: TipoChavePix?
    private var chavePix: String?
    
    
    

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
        self.conta = Conta(cpf:cpf)
    }
    
    deinit {
        print("Cliente excluído")
    }
    
    
    
    func verSaldo() -> String{
        return
        """
            Nome: \(self.nome)
            Agência: \(self.conta.agencia)
            Conta: \(self.conta.conta)
                            
                        
                            \(saldo)
        """
    }
    
    
    func depositar(valor: String){
        
        self.saldo += Double(valor)!
        
    }
    
    func excluirConta(clienteRemovidoIndex: Int) {
        
            
        Cliente.listaClientes.remove(at: clienteRemovidoIndex)
         
    }
    
    func clienteEstaDevendo() -> Bool{
        
        return self.saldo < 0
    }
    
    
    
    static func == (lhs: Cliente, rhs: Cliente) -> Bool {
        
        if(lhs.cpf != rhs.cpf){
            return false
        }
        return true
    }
    
    
    static func < (lhs: Cliente, rhs: Cliente) -> Bool {
        if(lhs.cpf != rhs.cpf){
            return false
        }
        return true
    }
    
    func getSenha() -> String{
        return self.senha
    }
    
    func getConta() -> Conta{
        return self.conta
    }
    
    
 
    
    
    
    
}


