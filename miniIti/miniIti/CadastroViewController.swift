//
//  CadastroViewController.swift
//  miniIti
//
//  Created by Romulo Basso Krebs on 21/10/21.
//

import UIKit

class CadastroViewController: UIViewController {
    
  
    @IBOutlet weak var swUserConfig: UISwitch!
    
    @IBOutlet var viewCadastro: UIView!
    
    var changed = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func colorUserConfig(_ sender: UISwitch) {
        
      
        if changed {
            viewCadastro.layer.sublayers?.remove(at: 0)
        }
        viewCadastro.layer.insertSublayer(changebackGround(swUserConfig.isOn, viewCadastro), at: 0)
      
          
        
    }
    
    
    func changebackGround(_ inverted: Bool, _ view: UIView) -> CAGradientLayer{
        
        
        let color1 = UIColor(named: "orange").unsafelyUnwrapped.cgColor
        let color2 = UIColor(named: "pink").unsafelyUnwrapped.cgColor
        var  gradient = CAGradientLayer()
        gradient.colors = inverted ? [color1, color2]: [color1, color2].reversed()
        gradient.locations = [0.0, 1.0]
        changed = true
        gradient.frame = view.bounds
        return gradient
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
