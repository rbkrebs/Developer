//
//  Sistema.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 01/10/21.
//

import Foundation


class Sistema{
    
    static var sairDoSistema: Bool = false
    let clienteController = ClienteController()
    let sistemaView = SistemaView()
   
    
    
    func inicializaSistema(){
        
       
        if let op = sistemaView.inicializaSistema(){
            switch op {
            case "1":
                
                if let clienteAutenticado = autenticaUsuario(){
                    acessaSistema(clienteAuth: clienteAutenticado)
                }else{
                    sistemaView.mensagemSistema(mensagem: "DADOS INVÁLIDOS")
                  
                }
                
            case "2":
                
                let clienteNovo: Cliente = Cliente.menuCriaCliente()
                acessaSistema(clienteAuth: clienteNovo)
                
            case "3":
                sistemaView.mensagemSistema(mensagem: "Tchauzin!")
                Sistema.sairDoSistema = true
                
            default:
                sistemaView.mensagemSistema(mensagem: "Opção inválida")
                Sistema.sairDoSistema = true
            }
            
        }
        
    }
    
    private func autenticaUsuario() -> Cliente?{
        
        let (conta, senha) = sistemaView.autenticacaoUsuario()
        
        guard let clienteLogado: Cliente = (clienteController.buscaCliente(conta: conta, senha: senha))
        else{
            
            return nil
        }
        return clienteLogado
        
    }
    
    
    private func acessaSistema(clienteAuth: Cliente){
        var cliente: Cliente? = clienteAuth
        var clienteLogado: Bool = true
        sistemaView.mensagemSistema(mensagem:
        """
                ************ VOCÊ ESTÁ LOGADO! **************"
                        "Escolha uma das opções abaixo"

        """)
 
        while(clienteLogado){
            
            OpcoesIti.listaOpcoes()
            let escolha = readLine()!
            switch escolha {
            case "1":
                
                let (agencia, conta) = sistemaView.transferir()
                
                if let clienteSortudo = clienteController.buscaConta(agencia: agencia, conta: conta){
                    let valor = sistemaView.depositar()
                    clienteSortudo.depositar(valor:valor)
                }else{
                    sistemaView.mensagemSistema(mensagem:"Conta não encontrada!")
                }
               
            case "2":print("1")
            case "3":print("1")
            case "4":
               
                let valor = sistemaView.depositar()
                cliente!.depositar(valor: valor)
            case "5":
                print(cliente!.verSaldo())
            case "6":
       
                let (podeExcluir, avaliacao) = clienteController.removerCliente(cliente: cliente)
                if podeExcluir{
                    print(avaliacao)
                    clienteLogado = false
                    //desalocar cliente da memória
                    cliente = nil
                }else{
                    print(avaliacao)
                }
                
            case "7": clienteLogado = false
            default:
                sistemaView.mensagemSistema(mensagem: "Opção inválida")
            }
            
        }
       
        
        
        
    }
    
}



