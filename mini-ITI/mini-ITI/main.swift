//
//  main.swift
//  mini-ITI
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import Foundation

var listaCliente:[Cliente] = []
var novoUsuario = (nome: "", cpf: "", telefone: "", endereco: "", ocupacao: "", renda: "", senha: "")



print("************ Bem vindo ao mini-ITI *****************")
print("Escolha uma das opções abaixo")
OpcoesEntrada.listaOpcoes()
print("Sua escolha:")
if let op = readLine(){
    switch op {
    case "1":
        print("entrar")
        
        
    case "2":
        print("********** NOVO USUÁRIO ************")
        print("Digite seu nome")
        novoUsuario.nome = readLine()!
        print("Digite seu cpf")
        novoUsuario.cpf = readLine()!
        print("Digite seu telefone")
        novoUsuario.telefone = readLine()!
        print("Digite seu endereço")
        novoUsuario.endereco = readLine()!
        print("Digite sua ocupação")
        novoUsuario.ocupacao = readLine()!
        print("Digite sua renda")
        novoUsuario.renda = readLine()!
        print("Digite sua senha")
        novoUsuario.senha = readLine()!
        let cliente = Cliente(nome: novoUsuario.nome,
                              cpf: novoUsuario.cpf,
                              telefone: novoUsuario.telefone,
                              endereco: novoUsuario.endereco,
                              ocupacao: novoUsuario.ocupacao,
                              renda: novoUsuario.renda,
                              senha: novoUsuario.senha)
        listaCliente.append(cliente)
        
        print(cliente)
    default:
        print("tchau")
    }
}





