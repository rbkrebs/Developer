//
//  ClienteView.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 04/10/21.
//

import Foundation


struct ClienteView{
    
    func menuCriaCliente(){
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
   
    }
    
}
