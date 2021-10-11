//
//  Database.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 11/10/21.
//

import Foundation


class Database{
    
    static var shared: Database = {
            let instance = Database()
            return instance
        }()
    
    private static var listaBanco:[Cliente] = []
    
    
    init(){}
    
    
    func salvar(salvar cliente: Cliente){
        Database.listaBanco.append(cliente)
        
    }
    
    
    
    
}
