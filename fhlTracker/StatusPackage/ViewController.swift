//
//  ViewController.swift
//  fhlTracker
//
//  Created by Jose Rivera on 13/03/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var numbersTextField: UITextField!
    
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
}

