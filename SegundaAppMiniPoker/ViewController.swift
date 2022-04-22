//
//  ViewController.swift
//  SegundaAppMiniPoker
//
//  Created by djdenielb on 31/03/22.
//

import UIKit

class ViewController: UIViewController, BetTransfer {
    
//    Variables globales
    let arrayCartas = [
        UIImage(named: "corazones 2"),
        UIImage(named: "corazones 3"),
        UIImage(named: "corazones 4"),
        UIImage(named: "corazones 5"),
        UIImage(named: "corazones 6"),
        UIImage(named: "corazones 7"),
        UIImage(named: "corazones 8"),
        UIImage(named: "corazones 9"),
        UIImage(named: "corazones 10"),
        UIImage(named: "corazones A"),
        UIImage(named: "corazones J"),
        UIImage(named: "corazones Q"),
        UIImage(named: "corazones K"),
        UIImage(named: "diamantes 2"),
        UIImage(named: "diamantes 3"),
        UIImage(named: "diamantes 4"),
        UIImage(named: "diamantes 5"),
        UIImage(named: "diamantes 6"),
        UIImage(named: "diamantes 7"),
        UIImage(named: "diamantes 8"),
        UIImage(named: "diamantes 9"),
        UIImage(named: "diamantes 10"),
        UIImage(named: "diamantes A"),
        UIImage(named: "diamantes J"),
        UIImage(named: "diamantes Q"),
        UIImage(named: "diamantes K"),
        UIImage(named: "picas 2"),
        UIImage(named: "picas 3"),
        UIImage(named: "picas 4"),
        UIImage(named: "picas 5"),
        UIImage(named: "picas 6"),
        UIImage(named: "picas 7"),
        UIImage(named: "picas 8"),
        UIImage(named: "picas 9"),
        UIImage(named: "picas 10"),
        UIImage(named: "picas A"),
        UIImage(named: "picas J"),
        UIImage(named: "picas Q"),
        UIImage(named: "picas K"),
        UIImage(named: "trebol 2"),
        UIImage(named: "trebol 3"),
        UIImage(named: "trebol 4"),
        UIImage(named: "trebol 5"),
        UIImage(named: "trebol 6"),
        UIImage(named: "trebol 7"),
        UIImage(named: "trebol 8"),
        UIImage(named: "trebol 9"),
        UIImage(named: "trebol 10"),
        UIImage(named: "trebol A"),
        UIImage(named: "trebol J"),
        UIImage(named: "trebol Q"),
        UIImage(named: "trebol K")]
    
//    Variables graficas
    @IBOutlet weak var ivCarta1: UIImageView!
    @IBOutlet weak var ivCarta2: UIImageView!
    @IBOutlet weak var ivCarta3: UIImageView!
    @IBOutlet weak var ivCarta4: UIImageView!
    @IBOutlet weak var ivCarta5: UIImageView!
    @IBOutlet weak var lblApuesta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    Funciones
    
//    Al presionar el boton jugar, las cartas se voltean y muestran aleatoriamente las cartas que del mazo
    @IBAction func btnJugar(_ sender: UIButton) {
        ivCarta1.image = arrayCartas.randomElement()!!
        ivCarta2.image = arrayCartas.randomElement()!!
        ivCarta3.image = arrayCartas.randomElement()!!
        ivCarta4.image = arrayCartas.randomElement()!!
        ivCarta5.image = arrayCartas.randomElement()!!
    }
    
    @IBAction func btnApostar(_ sender: UIButton) {
        ivCarta1.image = UIImage(named: "carta_volteada")
        ivCarta2.image = UIImage(named: "carta_volteada")
        ivCarta3.image = UIImage(named: "carta_volteada")
        ivCarta4.image = UIImage(named: "carta_volteada")
        ivCarta5.image = UIImage(named: "carta_volteada")
    }
    
    
//    Funcion del protocolo
    func transfer(bet: String) {
        lblApuesta.text = "Tu apuesta: \(bet) Pesos"
    }
//    Funcion que prepara e la primera pantall para recibir lo de la segunda
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let betScreen = segue.destination as! BetScreen
        betScreen.delegate = self
    }

}

