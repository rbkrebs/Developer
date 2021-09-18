//
//  ViewController.swift
//  JogoDaVelha
//
//  Created by Romulo Basso Krebs on 17/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    var counter : Int = 0
        
    enum Option{
        
        case bolinha
        case cruzado
        
        var simbolo : String {
            switch self {
            case .bolinha:
                return "⭕️"
            case .cruzado:
                return  "❌"
            }
        }
        
    
        
    }
    
    
    @IBOutlet var escolhas: [UIButton]!
    
    let optionList: [Option] = []
    
    @IBAction func optionUser(_ sender: UIButton) {
        
        if(counter<4){
            
            sender.setTitle(Option.cruzado.simbolo, for: UIControl.State.normal)
                escolhas.remove(at: escolhas.firstIndex(of: sender)!)
               
                let robo: UIButton = escolhas.randomElement()!
            robo.setTitle(Option.bolinha.simbolo, for: UIControl.State.normal)
                escolhas.remove(at: escolhas.firstIndex(of: robo)!)
                counter += 1
            
        }
       
    
        
    }
    
    
}

