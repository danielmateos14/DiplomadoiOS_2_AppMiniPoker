//
//  BetScreen.swift
//  SegundaAppMiniPoker
//
//  Created by djdenielb on 02/04/22.
//

import UIKit

    //Protocolos

//Pr(otocolo para transferir la apuesta a la primera pantalla
protocol BetTransfer{
    func transfer(bet: String)
}


class BetScreen: UIViewController, UITextFieldDelegate {

    //    Variables globales
    var bet: String?
    var delegate : BetTransfer?
    
    //    Variables de los elementos graficos
    @IBOutlet weak var tfBet: UITextField!
    @IBOutlet weak var btnJugar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Le decimos al VC que es el delegado del textField
        self.tfBet.delegate = self
        
        //        Desactivar boton jugar
        btnJugar.isEnabled = false
    }
    
//        Al momento de presionar btnBeat se cerrara el teclado y se abrira una alerta con  la cantidad apostada
    @IBAction func btnBeat(_ sender: UIButton) {
        //        Validacion textField de apuesta
        if tfBet.text == ""{
            bet = "0"
            funcionAlerta(bet: bet!)
//            print("nulo")
        }else{
            bet = tfBet.text
            funcionAlerta(bet: bet!)
//            print("nooo nulo")
        }
        
        //        Cerrar el teclado al presionar el boton
        //        self.view.endEditing(true)
        //        tfBet.resignFirstResponder()
        //        sender.resignFirstResponder()
        
    }
    
//    Alerta como funcion de la cantidad apostada
    func funcionAlerta(bet: String){
        let alerta = UIAlertController(title: "Cantidad apostada", message: "Tu apuesta es \(bet)", preferredStyle: .alert)
        //        Boton alerta con acciones al presionar el boton, las acciones son cerrar teclado y habilitar el boton jugar
        let botonAlerta = UIAlertAction(title: "ok", style: .default) { UIAlertAction in
            self.view.endEditing(true)
            self.btnJugar.isEnabled = true
        }
        alerta.addAction(botonAlerta)
        present(alerta, animated: true, completion: nil)
    }
    
//    Boton jugar
    @IBAction func btnJugar(_ sender: Any) {
        //  Al presionar el boton jugar se cerrara la View y se llevara el dato de cantidad para mostrarlo en el label
        
        delegate?.transfer(bet: bet!)
        
       //   Codigo para cerrar una view
        self.dismiss(animated: true, completion: nil)
    }
    

    
//    Funcion para cerrar el teclado al tocar fuera
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
//    Funcion para el protocolo del textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfBet.resignFirstResponder()
    }

    
}
