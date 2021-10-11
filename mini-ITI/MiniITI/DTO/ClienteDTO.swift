//
//  ClienteDTO.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 06/10/21.
//

import Foundation

struct ClienteDTO{
    
    private(set) var nome: String
    private(set) var cpf: String
    private(set) var telefone: String
    private(set) var endereco: String
    private(set) var ocupacao: String
    private(set) var renda: String
    private(set) var senha: String
    
    
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
        
    }
    
    //função aceitando somente caminho feliz
    func toModel(cliente: ClienteDTO) -> Cliente?{
        
        let clienteModel: Cliente = Cliente(nome: cliente.nome,
                                            cpf: cliente.cpf,
                                            telefone: cliente.telefone,
                                            endereco: cliente.endereco,
                                            ocupacao: cliente.ocupacao,
                                            renda: cliente.renda,
                                            senha: cliente.senha)
        
        return clienteModel
        
    }
    
    // TODO
    
    func validaCliente(cliente: ClienteDTO) throws -> Bool{
        
       
        
        return true
    }
    
 
}
