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
    
    var task: URLSession?
    var dataTickets: DataTicket?
    var ETA: String?
    var entregaEstimada: String?
    var statusFinal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Asigna el delegado del textField
        numbersTextField.delegate = self
        
        // Registra un gesto para cerrar el teclado cuando se toca la vista
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        // Peticion para el Token
        requesToken()
    }
    
    // Función para esconder el teclado cuando se toca fuera del textField
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    // Esto ajusta el TextField
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Allow all characters
        return true
    }
  /*  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Solo permitir números
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    // Implementa el siguiente método del UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Allow alphanumeric characters (letters and numbers)
        let allowedCharacters = CharacterSet.alphanumerics
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }*/
    
    // Accion del boton Rastreo/Rastrear
    @IBAction func rastroButtonAction(_ sender: Any) {
        guard let inputText = numbersTextField.text, !inputText.isEmpty else {
            // El campo de texto está vacío
            let alert = UIAlertController(title: "Aviso", message: "No has introducido un código", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
            
        // Aquí puedes continuar con tu lógica si el campo de texto no está vacío
        //print("El texto introducido es: \(inputText)")
        
        // Revisamos el token de nuevo
        if let savedToken = UserDefaults.standard.string(forKey: "token") {
            // El token se recuperó con éxito
            //print("Token recuperado: \(savedToken)")
            //requestTicket(savedToken: savedToken, inputText: inputText)
            requestTicketPlaneacion(token: savedToken, valueOf: inputText)
        } else {
            // No se encontró ningún token en UserDefaults
            print("No se encontró ningún token guardado en UserDefaults.")
        }
    }
    
    // Peticion del token
    @objc func requesToken() {
        let params = [ "username": "usrUSRSGD0001", "password": "Abcd1234"] as [String: Any]
        //print(params as Any)
        
        let request = NetworkLoader.createRequest(url: Api.EndPoint.login.url, data: params, method: .post)
        loadToken(request: request)
    }
    
    // Respuesta del Token
    @objc func loadToken(request: URLRequest) {
        showActivityIndicator()
        task = NetworkLoader.loadData(request: request, completion: {[weak self] (result: MyResult<ResponseLogin>) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.hideActivityIndicator()
                
                switch result {
                case .success(let dat):
                    //print("si" , dat)
                    
                    // Verificamos que el token no venga vacio
                    if dat.token != nil && dat.token != "" {
                        // Código para ejecutar si dat.token no es nil ni una cadena vacía
                        //print("El token es válido: \(String(describing: dat.token))")
                        
                        //Lo guardamos en UserDefaults
                        UserDefaults.standard.setValue(dat.token, forKey: "token")
                    } else {
                        // Código para ejecutar si dat.token es nil o una cadena vacía
                        print("El token es nil o una cadena vacía.")
                        
                        // Mostrar una alerta
                        let alert = UIAlertController(title: nil, message: "Token no obtenido.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                case .failure(let error):
                    self.showAlert(title: "Ups.", message: error.localizedDescription)
                }
            }
        })
    }
    
    // Peticion del Ticket
    @objc func requestTicket(savedToken: String, inputText: String) {
        //print("requestTicket: ", savedToken, inputText)
        // Verificamos que el token no venga vacio
        if savedToken.isEmpty {
            // Código para ejecutar si savedToken es nil o una cadena vacía
            //print("El token es nil o una cadena vacía.")

            // Mostrar una alerta
            let alert = UIAlertController(title: nil, message: "Token no válido.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

            // Eliminar el token de UserDefaults
            UserDefaults.standard.removeObject(forKey: "token")
        } else {
            // Código para ejecutar si savedToken no es nil ni una cadena vacía
            //print("El token es válido: \(String(describing: savedToken))")
            
            // Peticion para TicketDetail
            requestTicketDetail(token: savedToken, valueOf: inputText)
        }
    }
    
    // Peticion para TicketDetail
    @objc func requestTicketDetail(token: String, valueOf: String) {
        //let params = [ "ticket": valueOf ] as [String: Any]
        let params = ["": ""] as [String: Any]
        
        // Header (Token)
        let headers = [
            "Authorization": token,
        ]
        
        let request = NetworkLoader.createRequestHeader(url: "\(Api.EndPoint.tickets.url)/\(valueOf)", data: params, method: .get, headers: headers)
        loadTicketDetails(request: request)
    }
    
    @objc func loadTicketDetails(request: URLRequest) {
        showActivityIndicator()
        task = NetworkLoader.loadData(request: request, completion: {[weak self] (result: MyResult<ResponseTickets>) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.hideActivityIndicator()
                //print("Result: ", result)
                
                switch result {
                case .success(let dat):
                    //print("dat: ", dat as Any)
                    
                    //Revisamos que el codigo sea 200 (exito)
                    if dat.status == 200 {
                        //Revisamos que data no sea null
                        if dat.data != nil {
                            // Asigna la data obtenida a la variable de instancia
                            self.dataTickets = dat.data
                                            
                            // Llama al método para enviar la data a la vista de destino
                            self.sendDataToDestination()
                            
                        } else {
                            // Mostrar una alerta
                            let alert = UIAlertController(title: nil, message: "Ticket sin información.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                    } else {
                        //Mostramos el error con una alerta
                        self.responseCode(code: dat.status ?? 0)
                        self.showAlert(title: "Ups.", message: "\(dat.status!)   \(String(describing: dat.message))")
                    }
                    
                case.failure(let error):
                    // Mostrar una alerta
                    //print(error.localizedDescription)
                    let alert = UIAlertController(title: "Error", message: "Ocurrio un error con los datos.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
    }
    
    // Peticion para TicketsPlaneacion
    @objc func requestTicketPlaneacion(token: String, valueOf: String) {
        // Construir URL con parámetros
        var urlComponents = URLComponents(string: Api.EndPoint.getTicketsPlaneacion.url)!
        urlComponents.queryItems = [
            URLQueryItem(name: "FolioTicket", value: valueOf)
        ]
        
        guard let urlWithParams = urlComponents.url else {
            print("URL inválida")
            return
        }
        
        // Configurar encabezados
        let headers = [
            "Authorization": token
        ]
        
        // Crear la solicitud
        let request = NetworkLoader.createRequestHeader(url: urlWithParams.absoluteString, data: [:], method: .get, headers: headers)
        
        // Cargar el ticket de planeación
        loadTicketPlaneacion(request: request)
    }
    
    @objc func loadTicketPlaneacion(request: URLRequest) {
        showActivityIndicator()
        task = NetworkLoader.loadData(request: request, completion: {[weak self] (result: MyResult<ResponseTicketPlaneacion>) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.hideActivityIndicator()
                //print("Result: ", result)
                
                switch result {
                case .success(let dat):
                    //print("dat: ", dat as Any)
                    
                    //Revisamos que el codigo sea 200 (exito)
                    if dat.status == 200 {
                        //Revisamos que data no sea null
                        if dat.data?[0].folioTicket != nil {
                            // Asigna la data obtenida a la variable de instancia
                            //self.dataTickets = dat.data
                                            
                            // Llama al método para enviar la data a la vista de destino
                            //self.sendDataToDestination()
                            
                            // Revisamos el token de nuevo
                            if let savedToken = UserDefaults.standard.string(forKey: "token") {
                                // El token se recuperó con éxito
                                //print("Token recuperado: \(savedToken)")
                                self.ETA = dat.data?[0].etaDestino ?? ""
                                self.entregaEstimada = dat.data?[0].fechaPromesaLlegada
                                self.requestTicketDetail(token: savedToken, valueOf: dat.data?[0].folioTicket ?? "")
                            } else {
                                // No se encontró ningún token en UserDefaults
                                print("No se encontró ningún token guardado en UserDefaults.")
                            }
                            
                            
                        } else {
                            // Mostrar una alerta
                            let alert = UIAlertController(title: nil, message: dat.message, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                    } else {
                        //Mostramos el error con una alerta
                        self.responseCode(code: dat.status ?? 0)
                        self.showAlert(title: "Ups.", message: "\(dat.status!)   \(String(describing: dat.message))")
                    }
                    
                case.failure(let error):
                    // Mostrar una alerta
                    //print(error.localizedDescription)
                    let alert = UIAlertController(title: "Error", message: "Ocurrio un error con los datos.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
    }
    
    // Método para enviar la data a la vista de destino
    func sendDataToDestination() {
        // Verifica si la data está disponible
        guard let dataTickets = self.dataTickets else {
            // Si la data no está disponible, no hagas nada
            // Mostrar una alerta
            let alert = UIAlertController(title: "Error", message: "Ocurrio un error con los datos.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        // Crea una instancia de la vista de destino
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "statusPackageVC") as! StatusPackageViewController
        
        // Asigna la data a la propiedad en la vista de destino
        storyboard.dataTickets = dataTickets
        
        if(dataTickets.estatusId == 3) {
            setETAvsEE()
            storyboard.statusFinal = self.statusFinal
        } else {
            // Vacio
        }
        
        // Presenta la vista de destino
        //self.present(destinationVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    func setETAvsEE() {
        //print(ETA as Any, entregaEstimada as Any)
        // Formatear las fechas
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        // Suponiendo que entregaEstimada y ETA son cadenas (strings) con las fechas en el mismo formato
        let entregaEstimada2 = self.entregaEstimada // o nil si está vacía
        let ETA = self.ETA // o nil si está vacía

        // Parsear las fechas
        let fechaEntregaEstimada = entregaEstimada2 != nil ? formatter.date(from: entregaEstimada2!) : nil
        let fechaETA = ETA != nil ? formatter.date(from: ETA!) : nil

        //print(fechaEntregaEstimada as Any, fechaETA as Any)
        
        // Comparar las fechas
        let status: String
        if let fechaETA = fechaETA, let fechaEntregaEstimada = fechaEntregaEstimada {
            if fechaETA < fechaEntregaEstimada {
                status = "En tiempo"
            } else {
                status = "Retrasado"
            }
        } else if fechaETA == nil {
            //status = "Fecha ETA no válida"
            print("ETA invalida")
            status = "En ruta"
        } else {
            //status = "Fecha de entrega estimada no válida"
            print("Fecha de entrega estimada no valida")
            status = "En ruta"
        }

        self.statusFinal = status
        print(status)
    }
}

