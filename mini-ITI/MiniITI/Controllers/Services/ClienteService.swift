//
//  ClienteService.swift
//  MiniIti
//
//  Created by Romulo Basso Krebs on 05/10/21.
//

import Foundation

struct ClienteService{
    
    func validaCpf(cpf: String) throws -> (ehValid: Bool, convertido: Double?){
        
        if cpf.count != 11 {
            throw ValidationError.cpfInvalido
        }else{
            for character in cpf{
                if character.isLetter{
                    throw ValidationError.cpfInvalido
                }
            }
        }
        
        return (true, Double(cpf))
        
    }
    
    func salvarCliente(cliente: Cliente) throws{
        //TODO
        /*do {
            try
                <#throwing expression#>
        } catch  {
            
           
        }*/
        
    }
    
    
    
}
