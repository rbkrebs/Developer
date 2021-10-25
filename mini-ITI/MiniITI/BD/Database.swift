//
//  Database.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 11/10/21.
//

import Foundation


class Database{
    
    
    static var shared = Database()
    
    private var listaBanco:[Cliente] = []
    
    
    private init(){}
    
    
    func salvar(salvar cliente: Cliente){
        self.listaBanco.append(cliente)
        
    }
    
    func getListabanco() -> [Cliente]{
        return self.listaBanco
    }
    
    func excluir(_ index: Int){
        self.listaBanco.remove(at: index)
    }
    
    
    
    
}
