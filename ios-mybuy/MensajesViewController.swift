//
//  MensajesViewController.swift
//  ios-mybuy
//
//  Created by Alexis on 21/11/18.
//  Copyright © 2018 Alexis. All rights reserved.
//

import UIKit
import Alamofire

class MensajesViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var lstContactos = [Contacto]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return lstContactos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 100
        
        let contacto = lstContactos[indexPath.row]
        
        let cellView = tableView.dequeueReusableCell(withIdentifier: "cellMensaje", for: indexPath)
        
        let lblNombre = cellView.viewWithTag(1) as? UILabel
        let lblNumero = cellView.viewWithTag(2) as? UILabel
        
        lblNombre?.text = contacto.nombre
        lblNumero?.text = contacto.telefono
    
        return cellView
    }
    
    func buscarUsuarios(){
        
        let parametros = [
            "numero_telefono":""
        ]
        
        let URL_USUARIOS = "http://localhost:8080/MyBuy/rest/MyBuyRest/buscarTelefono"
        
        Alamofire.request(URL_USUARIOS,method: .post,parameters: parametros, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let resultado) :
                print(resultado)
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

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        print(lstContactos.count)
        // Do any additional setup after loading the view.
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
