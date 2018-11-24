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
            switch response.result {
            case .success(let resultado) :
                
                let r = resultado as? Int
                
                if(r == 1) {
                    let alertController = UIAlertController(title: "", message: "Registro Exitoso", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "ERROR", message: "No se pudo registrar", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
