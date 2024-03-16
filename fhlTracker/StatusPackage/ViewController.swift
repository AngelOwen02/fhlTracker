//
//  ViewController.swift
//  fhlTracker
//
//  Created by Jose Rivera on 13/03/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var numbersTextField: UITextField!
    @IBOutlet weak var rastreoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Asigna el delegado del textField
        numbersTextField.delegate = self
        
        // Registra un gesto para cerrar el teclado cuando se toca la vista
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    // Función para esconder el teclado cuando se toca fuera del textField
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    //Esto ajusta el TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Obtén la posición del textField en relación con la ventana principal
        if let textFieldFrame = textField.superview?.convert(textField.frame, to: nil) {
            // Calcula la cantidad de desplazamiento necesario
            let offset = textFieldFrame.origin.y - (view.frame.height - textFieldFrame.height)
            
            // Ajusta la posición de la vista si es necesario
            if offset > 0 {
                UIView.animate(withDuration: 0.3) {
                    // Cambia el origen de la vista para que el textField esté visible
                    self.view.frame.origin.y = -offset
                }
            }
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Restablece la posición de la vista cuando se finaliza la edición del textField
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    // Implementa el siguiente método del UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Solo permitir números
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    @IBAction func rastroButtonAction(_ sender: Any) {
        guard let inputText = numbersTextField.text, !inputText.isEmpty else {
            // El campo de texto está vacío
            let alert = UIAlertController(title: "Aviso", message: "No has introducido un código", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
            
        // Aquí puedes continuar con tu lógica si el campo de texto no está vacío
        // Por ejemplo:
        print("El texto introducido es: \(inputText)")
    }
    
    @objc func requesToken() {
        let params = [ "username": "usrPhoenixAdmin", "password": "phoenix123$"] as [String: Any]
        print(params as Any)
        
        let request = NetworkLoader.createRequestHeader(url: Api.EndPoint.login.url, data: params, method: .post)
        //loadRank(request: request)
    }
}

