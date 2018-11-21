//
//  ViewController.swift
//  ios-mybuy
//
//  Created by Alexis on 21/11/18.
//  Copyright © 2018 Alexis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    
    
    
    @IBAction func btnIngresar(_ sender: Any) {
        print("btnIngresar")
        
        performSegue(withIdentifier: "goMensajes", sender: nil)
    }
    
    
    @IBAction func btnRegistrarse(_ sender: Any) {
        print("btnRegistrarse")
        
        performSegue(withIdentifier: "goRegistrarse", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtNumero.keyboardType = UIKeyboardType.numberPad
    }


}

