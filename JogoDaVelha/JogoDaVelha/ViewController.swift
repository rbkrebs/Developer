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
        
        if(counter<4){

            sender.setTitle(Option.cross.symbol, for: UIControl.State.normal)
            
            saveSelectedOptions(sender: options.firstIndex(of: sender)!, option: Option.cross)
           

            var robo: UIButton = options.randomElement()!
            
            while(robo.currentTitle != nil ){
               
                robo = options.randomElement()!
                
                
            }
            robo.setTitle(Option.nought.symbol, for: UIControl.State.normal)
            
            saveSelectedOptions(sender: options.firstIndex(of: robo)!, option: Option.nought)
            
            counter += 1

                }
           
    }
    
    func saveSelectedOptions(sender: Int, option : Option){
        
    
        let indexOfOptions = sender
       
        escolhas[indexOfOptions] = option
        
        if checkHasWinner(){
            
            let alert = UIAlertController(title: "Cabô o jogo", message: "Pressione clear para recomeçar", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            
        }
       
       
    }
    
    func checkHasWinner() -> Bool{
        
        let variable: [Set<Int>] = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,6,8]]
        var winner: Bool = false
        var robo: [Int] = []
        var player: [Int] = []
        
        for escolha in escolhas{
            
            if escolha.value == Option.nought{
                robo.append(escolha.key)
            }else{
                player.append(escolha.key)
            }
        }
    
        for i in variable{
            
           
            if  i.isSubset(of: robo){
                winner = true
            }
            else if  i.isSubset(of: player){
                winner = true
            }
           
        }
        
        return winner
    
    }
}

