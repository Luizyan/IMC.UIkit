//
//  ViewController.swift
//  IMC.UIkit
//
//  Created by Luiz Yan on 24/12/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var viResult: UIView!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
            imc = weight / (height * height)
        }
        showResult()
    }
    func showResult (){
        var image: String = ""
        var result: String = ""
        
        switch imc {
            case 0..<16:
                image = "abaixo"
                result = "Você está em baixo do peso ideal."
            case 16..<25:
                image = "ideal"
                result = "Você está no peso ideal."
            case 25..<30:
                image = "sobre"
                result = "Você está acima do peso ideal."
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}

