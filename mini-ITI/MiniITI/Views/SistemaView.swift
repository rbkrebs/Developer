//
//  SistemaView.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 04/10/21.
//

import Foundation


struct SistemaView{
    
    func inicializaSistema() -> String?{
        
        print("************ Bem vindo ao mini-ITI *****************")
        print("Escolha uma das opções abaixo")
        OpcoesEntrada.listaOpcoes()
        print("Sua escolha:")
        return readLine()
    }
    
    func mensagemSistema(mensagem: String){
        print(mensagem)
    }
    
    func autenticacaoUsuario() -> (String, String){
        
        print("Digite o número da conta")
        let conta: String = readLine()!
        print("Digite a sua senha")
        let senha: String = readLine()!
        return (conta, senha)
        
    }
    
    func transferir() -> (agencia:String,conta:String){
        
        print("Digite a agência para transfênria")
        let agencia: String = readLine()!
        print("Digite o número da conta")
        let conta: String =  readLine()!
        
        
        return (agencia, conta)
        
        
    }
    
    func depositar() -> String{
        
        print("Quanto você deseja depositar: R$")
        let valor: String = readLine()!
        return valor
        
    }
    
    
    
    
}
