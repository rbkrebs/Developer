//
//  Sistema.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 01/10/21.
//

import Foundation


class SistemaController{
    
    static var sairDoSistema: Bool = false
    let clienteController = ClienteController()
    let sistemaView = SistemaView()
    let clienteView = ClienteView()
    static var listaClientes: [Cliente] = []
    let clienteService = ClienteService()
   
    
    
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
                let viewDadosNovoCliente = clienteView.menuCriaCliente()
                let novoClienteDTO = ClienteDTO(nome: viewDadosNovoCliente.nome,
                                                cpf: viewDadosNovoCliente.cpf,
                                                telefone: viewDadosNovoCliente.telefone,
                                                endereco: viewDadosNovoCliente.endereco,
                                                ocupacao: viewDadosNovoCliente.ocupacao,
                                                renda: viewDadosNovoCliente.renda,
                                                senha: viewDadosNovoCliente.renda)
                
                if let clienteNovo: Cliente = clienteService.toModel(cliente: novoClienteDTO){
                    SistemaController.listaClientes.append(clienteNovo)
                    acessaSistema(clienteAuth: clienteNovo)
                }else{
                    sistemaView.mensagemSistema(mensagem: "Falha ao cadastrar novo cliente")
                }
                
                
              
                
                
            case "3":
                sistemaView.mensagemSistema(mensagem: "Tchauzin!")
                SistemaController.sairDoSistema = true
                
            default:
                sistemaView.mensagemSistema(mensagem: "Opção inválida")
                SistemaController.sairDoSistema = true
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
            
            
            let escolha = clienteView.opcoesMenuCLiente()
            switch escolha {
            case "1":
                
                let contaTransferencia = sistemaView.transferir()
                
                if let clienteBeneficario = clienteController.buscaConta(conta: Conta(conta: contaTransferencia.conta, agencia: contaTransferencia.agencia)){
                    let valor = sistemaView.depositar()
                    clienteBeneficario.depositar(valor:valor)
                }else{
                    sistemaView.mensagemSistema(mensagem:"Conta não encontrada!")
                }
               
            case "2":
                if cliente?.getChavePix() == nil{
                    sistemaView.mensagemSistema(mensagem: "Cadastre sua chave PIX")
                }else{
                    let clienteBeneficario = sistemaView.pagarPix()
                    if  clienteController.pagaClientePix(chavePix: clienteBeneficario.chavePix, valor: clienteBeneficario.valor){
                        sistemaView.mensagemSistema(mensagem: "PIX realizado com sucesso")
                    }else{
                        sistemaView.mensagemSistema(mensagem: "Erro ao tentar realizar o PIX. Verifique se os valores informados estão corretos")
                    }
                }
                 
            
            case "3":
                let pix = sistemaView.cadastrarPix()
                cliente?.setChavePix(chavePix: pix.chavePix)
                cliente?.setTipoChavePix(tipoChavePix: pix.tipoPix)
            case "4":
               
                let valor = sistemaView.depositar()
                cliente!.depositar(valor: valor)
            case "5":
                sistemaView.mensagemSistema(mensagem:cliente!.verSaldo())
            case "6":
       
                let (podeExcluir, avaliacao) = clienteController.removerCliente(cliente: cliente)
                if podeExcluir{
                    sistemaView.mensagemSistema(mensagem:avaliacao)
                    clienteLogado = false
                    //desalocar cliente da memória
                    cliente = nil
                }else{
                    sistemaView.mensagemSistema(mensagem:avaliacao)
                }
                
            case "7": clienteLogado = false
            default:
                sistemaView.mensagemSistema(mensagem: "Opção inválida")
            }
            
        }
       
        
        
        
    }
    
}



