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
    private var telefone: String
    private var endereco: String
    private var ocupacao: String
    private var renda: String
    private var senha: String
    private let conta: Conta
    private var saldo: Double = 0
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
            ChavePIX: \(self.chavePix ?? "ChavePIX não cadastrada")
                            
                        
                            \(saldo)
        """
    }
    
    func debitar(valor: String){
        
        self.saldo -= Double(valor) ?? 0
    }
    
    
    func depositar(valor: String){
        
        self.saldo += Double(valor) ?? 0
        
    }
    
    func clienteEstaDevendo() -> Bool{
        
        return self.saldo < 0
    }
    
    func getChavePix() -> String?{
        return self.chavePix
    }
    func setChavePix(chavePix: String){
        self.chavePix = chavePix
    }
    
    func setTipoChavePix(tipoChavePix: String){
        self.tipoChavePix = TipoChavePix(rawValue: Int(tipoChavePix) ?? 0)
    }
    
    
    
    static func == (lhs: Cliente, rhs: Cliente) -> Bool {
        
        if(lhs.cpf != rhs.cpf){
            return false
        }
        return true
    }
    
    //Nada definido ainda pra essa função. Implementada por conta do contrato
    static func < (lhs: Cliente, rhs: Cliente) -> Bool {
        if(lhs.nome != rhs.nome){
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
    
    func getCpf() -> String{
        return self.cpf
    }
    
    
 
    
    
    
    
}


