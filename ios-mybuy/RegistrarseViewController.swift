//
//  RegistrarseViewController.swift
//  ios-mybuy
//
//  Created by Alexis on 21/11/18.
//  Copyright © 2018 Alexis. All rights reserved.
//

import UIKit
import Alamofire

class RegistrarseViewController: UIViewController {

    
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtCategoria: UITextField!
    @IBOutlet weak var txtDescripcion: UITextField!
    
    
    @IBAction func btAceptar(_ sender: Any) {
        guard let numero = txtNumero.text else {
            return
        }
        
        guard let contrasena = txtContrasena.text else {
            return
        }
        
        guard let nombre = txtNombre.text else {
            return
        }
        
        guard let categoria = txtCategoria.text else {
            return
        }
        
        guard let descripcion = txtDescripcion.text else {
            return
        }
        
        let parametros = [
            "numero_telefono": numero,
            "contrasenia": contrasena,
            "nickname": nombre,
            "categoria": categoria,
            "numero_cuenta_bancaria": "foo",
            "descripcion": descripcion
        ]
        
        let URL_REGISTRO = "http://localhost:8080/MyBuy/rest/MyBuyRest/registrarUsuario"
        
        Alamofire.request(URL_REGISTRO,method: .post,parameters: parametros, encoding: JSONEncoding.default).responseJSON { response in
            
            print(response)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
