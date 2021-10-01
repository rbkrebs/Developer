//
//  Sistema.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 01/10/21.
//

import Foundation


class Sistema{
    
    static var sairDoSistema: Bool = false
    
    func inicializaSistema(){
        
        print("************ Bem vindo ao mini-ITI *****************")
        print("Escolha uma das opções abaixo")
        OpcoesEntrada.listaOpcoes()
        print("Sua escolha:")
        if let op = readLine(){
            switch op {
            case "1":
                
                if let clienteAutenticado = autenticaUsuario(){
                    acessaSistema(cliente: clienteAutenticado)
                }else{
                    print("DADOS INVÁLIDOS")
                }
                
                
            case "2":
                
                let clienteNovo: Cliente = Cliente.menuCriaCliente()
                acessaSistema(cliente: clienteNovo)
                
            case "3":
                print("tchau")
                Sistema.sairDoSistema = true
                
            default:
                print("Opção inválida!")
                Sistema.sairDoSistema = true
            }
            
        }
        
    }
    
    private func autenticaUsuario() -> Cliente?{
        
        print("Digite o número da conta")
        let conta: String = readLine()!
        print("Digite a sua senha")
        let senha: String = readLine()!
        
        guard let clienteLogado: Cliente = (Cliente.buscaCliente(conta: conta, senha: senha))
        else{
            
            return nil
        }
        return clienteLogado
        
    }
    
    
    private func acessaSistema(cliente: Cliente){
        
        var clienteLogado: Bool = true
        print("************ VOCÊ ESTÁ LOGADO! **************")
        print("Escolha uma das opções abaixo")
        while(clienteLogado){
            
            OpcoesIti.listaOpcoes()
            let escolha = readLine()!
            switch escolha {
            case "1":
                print("Digite a agência para transfênria")
                let agencia: String = readLine()!
                print("Digite o número da conta")
                let conta: String =  readLine()!
                if let clienteSortudo = Cliente.buscaConta(agencia: agencia, conta: conta){
                    print("Informe o valor a ser depositado")
                    let valor: String = readLine()!
                    clienteSortudo.depositar(valor:valor)
                }else{
                    print("Conta não encontrada!")
                }
               
            case "2":print("1")
            case "3":print("1")
            case "4":
                print("Quanto você deseja depositar: R$")
                let valor: String = readLine()!
                cliente.depositar(valor: valor)
            case "5":
                print(cliente.verSaldo())
            case "6":print("1")
            case "7": clienteLogado = false
            default:
                print("OPÇÃO INVÁLIDA")
            }
            
        }
       
        
        
        
    }
    
}



