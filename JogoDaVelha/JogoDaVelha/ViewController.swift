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
        
        case nought
        case cross
        
        var symbol : String {
            switch self {
            case .nought:
                return "⭕️"
            case .cross:
                return  "❌"
            }
        }
        
    
        
    }
    
    
    @IBOutlet var options: [UIButton]!
    
    var escolhas: [Int:Option] = [:]
    
    @IBAction func clickUser(_ sender: UIButton) {
        
        saveSelectedOptions(sender: sender, option: Option.cross)
        sender.setTitle(Option.cross.symbol, for: UIControl.State.normal)
           
    }
    
    func saveSelectedOptions(sender: UIButton, option : Option){
        
    
        let indexOfOptions = options.firstIndex(of: sender)!
       
        escolhas[indexOfOptions] = option
        
        print(checkHasWinner())
       
    }
    
    func checkHasWinner() -> Bool{
        
        let variable: [Set<Int>] = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,6,8]]
        var winner: Bool = false
        for i in variable{
            
            winner = i.isSubset(of: escolhas.keys)
            if winner{
                return winner
            }
           
        }
        
        return winner
       
        
        
        
    }
    
    
    
    
}

