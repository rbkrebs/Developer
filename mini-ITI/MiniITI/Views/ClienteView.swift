//
//  ClienteView.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 04/10/21.
//

import Foundation


struct ClienteView{
    
    func menuCriaCliente() -> (nome: String,
                               cpf: String,
                               telefone: String,
                               endereco: String,
                               ocupacao: String,
                               renda: String,
                               senha: String){
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
        
        return (nome, cpf, telefone, endereco, ocupacao, renda, senha)
   
   
    }
    
    func opcoesMenuCLiente() -> String{
        
        OpcoesIti.listaOpcoes()
        let escolha = readLine()!
        return escolha
    }
    
    
    
}
