//
//  ViewController.swift
//  ios-mybuy
//
//  Created by Alexis on 21/11/18.
//  Copyright © 2018 Alexis. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    
    var lstContactos = [Contacto]()
    
    
    @IBAction func btnIngresar(_ sender: Any) {
        print("btnIngresar")
        
        guard let numero = txtNumero.text else {
            return
        }
        
        guard let contrasena = txtContrasena.text else {
            return
        }
        
        lstContactos = [Contacto]()
        
        if numero == "admin" && contrasena == "admin" {
            
            let parametros = [
                "numero_telefono":""
            ]
            
            let URL_USUARIOS = "http://localhost:8080/MyBuy/rest/MyBuyRest/buscarTelefono"
            
            Alamofire.request(URL_USUARIOS,method: .post,parameters: parametros, encoding: JSONEncoding.default).responseJSON { response in
                
                switch response.result {
                case .success(let resultado) :
                    
                    let miJSON = resultado as! [NSDictionary]
                    
                    
                    for contacto in miJSON {
                        let id = contacto["codigo_usuario"] as! Int
                        let nombre = contacto["nickname"] as! String
                        let numero = contacto["numero_telefono"] as! String
                        
                        let nuevoContacto = Contacto(id: id, nombre: nombre, telefono: numero)
                        
                        self.lstContactos.append(nuevoContacto);
                        
                    }
                    self.performSegue(withIdentifier: "goMensajes", sender: nil)
                    break
                case .failure(let error) :
                    print("ERROR")
                    print(error)
                    break
                }
            }
        
        
        } else {
            let alertController = UIAlertController(title: "Error", message: "El usuario no existe", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnRegistrarse(_ sender: Any) {
        print("btnRegistrarse")
        
        performSegue(withIdentifier: "goRegistrarse", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier=="goMensajes") {
            let mensajesView = segue.destination as? MensajesViewController
            
            mensajesView?.lstContactos = self.lstContactos
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtNumero.keyboardType = UIKeyboardType.numberPad
    }
    
    func buscarUsuarios(){
        
        let parametros = [
            "numero_telefono":""
        ]
        
        let URL_USUARIOS = "http://localhost:8080/MyBuy/rest/MyBuyRest/buscarTelefono"
        
        Alamofire.request(URL_USUARIOS,method: .post,parameters: parametros, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let resultado) :
                
                let miJSON = resultado as! [NSDictionary]
                
                
                for contacto in miJSON {
                    let id = contacto["codigo_usuario"] as! Int
                    let nombre = contacto["nickname"] as! String
                    let numero = contacto["numero_telefono"] as! String
                    
                    let nuevoContacto = Contacto(id: id, nombre: nombre, telefono: numero)
                    
                    self.lstContactos.append(nuevoContacto);
                    
                }
                
                break
            case .failure(let error) :
                print("ERROR")
                print(error)
                break
            }
        }
    }


}

