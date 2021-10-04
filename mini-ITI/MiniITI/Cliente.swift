//
//  Cliente.swift
//  mini-ITI
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import Foundation


class Cliente: Comparable{
    
    
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
    
    
    
    let nome: String
    let cpf: String
    let telefone: String
    let endereco: String
    let ocupacao: String
    let renda: String
    let senha: String
    let conta: Conta
    private(set) var saldo: Double = -1
    static var listaClientes: [Cliente] = []
    
    
    

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
            \(self.nome)
            \(self.conta.agencia)
            \(self.conta.conta)
                            
                        
                            \(saldo)
        """
    }
    
    class func menuCriaCliente() -> Cliente{
        
        print("********** NOVO USUÁRIO ************")
        print("Digite seu nome")
        let nome:String = readLine()!
        print("Digite seu cpf")
        let cpf:String = readLine()!
        print("Digite seu telefone")
        let telefone:String = readLine()!
        print("Digite seu endereço")
        let endereco:String = readLine()!
        print("Digite sua ocupação")
        let ocupacao: String = readLine()!
        print("Digite sua renda")
        let renda:String = readLine()!
        print("Digite sua senha")
        let senha:String = readLine()!
        let cliente = Cliente(nome: nome,
                              cpf: cpf,
                              telefone: telefone,
                              endereco: endereco,
                              ocupacao: ocupacao,
                              renda: renda,
                              senha: senha)
        Cliente.listaClientes.append(cliente)
        return cliente
    }
    
    
    class func buscaCliente(conta: String,senha:String) -> Cliente?{
        
        return Cliente.listaClientes.filter{$0.senha == senha && $0.conta.conta == conta}.first ?? nil
    }
    
    class func buscaConta(agencia: String, conta:String) -> Cliente?{
        
        return Cliente.listaClientes.filter{$0.conta.agencia == agencia && $0.conta.conta == conta}.first ?? nil
        
    }
    
    func depositar(valor: String){
        
        self.saldo += Double(valor)!
        
    }
    
    func excluirConta() -> (Bool,String) {
        
        if(clienteEstaDevendo()){
            return (true, "Cliente possui débitos com o banco! Regularize já sua situação para continuar com a operação de exclusão")
        }
        else{
            var clienteRemovidoIndex = 0
            for (index, cliente) in Cliente.listaClientes.enumerated(){
                if(cliente == self){
                    
                    clienteRemovidoIndex = index
                }
            }
            
            Cliente.listaClientes.remove(at: clienteRemovidoIndex)
            return (false, "")
        }
        
    }
    
    func clienteEstaDevendo() -> Bool{
        
        return self.saldo < 0
    }
    
    
    
    
    
    
    
}


