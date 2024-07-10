//
//  StatusPackageViewController.swift
//  fhlTracker
//
//  Created by Jose Rivera on 19/03/24.
//

import UIKit

class StatusPackageViewController: UIViewController {
    @IBOutlet weak var folioText: UILabel!
    @IBOutlet weak var statusIdText: UILabel!
    @IBOutlet weak var processStatus: UIImageView!
    @IBOutlet weak var deliveryProcessStatus: UILabel!
    @IBOutlet weak var deliveryDateText: UILabel!
    @IBOutlet weak var deliveryHourText: UILabel!
    @IBOutlet weak var destinataryText: UILabel!
    @IBOutlet weak var contactText: UILabel!
    @IBOutlet weak var referencesText: UILabel!
    
    var dataTickets: DataTicket?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Revisamos la data desde un inicio
        if dataTickets != nil {
            print("DataStatus: ", dataTickets as Any)
            
            //Colocamos la informacion de la data
            folioText.text = dataTickets?.folioTicket
            
            //MARK: -ESTATUS DE TEXTO E IMAGENES-
            let mStatus = dataTickets?.estatusId
            
            switch(mStatus) {
            case 1:
                //statusIdText.text = "El estatus del pedido es : Recolectando"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : Recolectando")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Recolectando")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)

                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                processStatus.image = UIImage(named: "statusOne")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "Entrega estimada"
                break
                
            case 2:
                //statusIdText.text = "Asignado"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : Asignado")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Asignado")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)

                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                processStatus.image = UIImage(named: "statusTwo")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "Entrega estimada"
                break
                
            case 3:
                //statusIdText.text = "En ruta"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : En ruta")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "En ruta")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)

                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                processStatus.image = UIImage(named: "statusThree")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "Entrega estimada"
                break
                
            case 4:
                //statusIdText.text = "Entregado"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : Entregado")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Entregado")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)

                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                processStatus.image = UIImage(named: "statusFour")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "El paquete ha sido entregado"
                break
                
            case 5:
                //statusIdText.text = "No entregado"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : No entregado")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "No entregado")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)

                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                //processStatus.image = UIImage(named: "statusFour")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "El paquete no ha sido entregado"
                break
                
            case 6:
                //statusIdText.text = "Transferido"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : Transferido")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Transferido")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)

                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                //processStatus.image = UIImage(named: "statusFour")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "El paquete ha sido transferido"
                break
                
            case .none:
                //Error
                //statusIdText.text = "Preparando ruta"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : Preparando ruta")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Preparando ruta")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)

                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                //processStatus.image = UIImage(named: "statusFour")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "Preparando ruta"
                break
                
            case .some(_):
                //Error
                //statusIdText.text = "Fuera de rango"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : Fuera de rango")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Fuera de rango")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)

                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                //processStatus.image = UIImage(named: "statusFour")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "Fuera de rango"
                break
            }
            
        } else {
            // Mostrar una alerta
            let alert = UIAlertController(title: "Error", message: "Ocurrio un error con los datos.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        // MARK: - FECHA DE ENTREGA APROXIMADA -
        // Asignamos la fecha aproximada de entrega
        print ("FechaDe Data: ", dataTickets?.fechaPromesaEntrega as Any)
        var fechaData1 = dataTickets?.fechaPromesaEntrega

        // Verificar si fechaData no es nulo antes de agregar la "Z"
        if var fechaData = dataTickets?.fechaPromesaEntrega {
            fechaData += "Z"
            fechaData1 = fechaData
            //print(fechaData1 as Any)
        }

        // Desempaquetar la cadena de fecha opcional de manera segura
        guard let entrega = fechaData1 else {
            print("Error: La cadena de fecha es nula")
            
            // Asignamos la fecha con el error
            deliveryDateText.text = "--- --- --- ---"
            return
        }

        //print("Cadena de fecha:", entrega)

        // Convertir la cadena de fecha a un objeto de tipo Date
        let dateFormatter = ISO8601DateFormatter()
        guard let dateTime = dateFormatter.date(from: entrega) else {
            print("Error: No se pudo convertir la cadena de fecha a Date")
            
            // Asignamos la fecha con el error
            deliveryDateText.text = "--- --- --- ---"
            return
        }

        // Imprimir la fecha después de la conversión para verificar
        //print("Fecha convertida:", dateTime)

        // Definir un formateador de fecha personalizado para el formato de salida deseado
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es")
        formatter.dateFormat = "EEEE d 'de' MMMM yyyy"
        let inputDateFormats = ["yyyy-MM-dd'T'HH:mm:ss.SSS", "yyyy-MM-dd'T'HH:mm:ss"]

        // Formatear el objeto Date en el formato de salida deseado
        let formattedDate = formatter.string(from: dateTime)
        //print(formattedDate)

        // Asignamos la fecha ya procesada
        deliveryDateText.text = formattedDate
        
        // MARK: -HORA DE ENTREGA APROXIMADA-
        // Definir un formateador de fecha para el formato de entrada
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        // Convertir la cadena de entrada a un objeto Date
        if let date = inputFormatter.date(from: dataTickets?.fechaPromesaEntrega ?? "") {
            // Definir un formateador de fecha para el formato de salida
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "hh:mm a"
            outputFormatter.amSymbol = "a. m."
            outputFormatter.pmSymbol = "p. m."
            
            // Formatear el objeto Date en el formato de salida deseado
            let formattedDateString = outputFormatter.string(from: date)
            
            // Asignar la fecha formateada a la etiqueta
            deliveryHourText.text = formattedDateString
        } else {
            print("Fecha de entrada no válida")
            deliveryHourText.text = "--- ---"
        }
        
        //MARK: -FECHA DE INICIO-
        // Asignamos la fecha de inicio de la entrega
        /*var inicio1 = dataTickets?.fechaSolicitud
        print(inicio1 as Any)
        
        // Attempt to parse the input date string with each format
        var date: Date? = nil
        for format in inputDateFormats {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            if let parsedDate = formatter.date(from: inicio1 ?? "") {
                date = parsedDate
                break // Stop loop if a valid date is found
            }
        }
        
        if let validDate = date {
            // Define the output date format
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "dd/MM/yy"
            
            // Format the Date object into the desired output format
            let formattedDateString = outputDateFormatter.string(from: validDate)
            
            inicio1 = formattedDateString
            print(formattedDateString) // Prints: "10/06/24"
            
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Fecha: " + formattedDateString)

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Fecha: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)

            // Asignamos el attributedString al UILabel
            dateStartText.attributedText = attributedString
        } else {
            print("Invalid date string")
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Fecha: " + "--/--/----")

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Fecha: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)

            // Asignamos el attributedString al UILabel
            dateStartText.attributedText = attributedString
        }*/
        
        // Quita los últimos 4 caracteres
        //if let fechaSinUltimosCuatro = inicio1?.dropLast(4) {
        /*if let fechaSinUltimosCuatro = inicio1 {
            // Convierte el Substring a String
            var nuevaFechaString = String(fechaSinUltimosCuatro)
            //print(nuevaFechaString) // Output: 2024-03-15T18:21:20
            
            // Aquí puedes usar nuevaFechaString para lo que necesites
            // Le agregamos la Z al final
            nuevaFechaString += "Z"
            inicio1 = nuevaFechaString
        }*/
        
        // Verificar si la cadena de entrada es válida
        /*if let inicio = inicio1 {
            // Parsear la cadena de fecha a Date
            let dateFormatter = ISO8601DateFormatter()
            if let dateTime2 = dateFormatter.date(from: inicio) {
                // Define un formateador personalizado para el formato de salida deseado
                let formatter2 = DateFormatter()
                formatter2.dateFormat = "dd/MM/yy"
                
                // Formatea el objeto Date en el formato de salida deseado
                let formattedDate2 = formatter2.string(from: dateTime2)
                //print(formattedDate2) // Aquí puedes utilizar el valor formateado como necesites
                
                // Asignamos la fecha de inicio
                //dateStartText.text = formattedDate2
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "Fecha: " + formattedDate2)

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Fecha: ")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)

                // Asignamos el attributedString al UILabel
                dateStartText.attributedText = attributedString
            } else {
                print("Error al parsear la fecha")
                
                // Asignamos la fecha de inicio
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "Fecha: " + "--/--/----")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Fecha: ")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)

                // Asignamos el attributedString al UILabel
                dateStartText.attributedText = attributedString
            }
        } else {
            print("Cadena de entrada no válida")
            
            // Asignamos la fecha de inicio
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Fecha: " + "--/--/----")

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Fecha: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)

            // Asignamos el attributedString al UILabel
            dateStartText.attributedText = attributedString
        }*/
        
        //MARK: -DESTINATARIO-
        if dataTickets?.destinatarios.razonSocial != nil {
            // Asignamos el destinatario
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Destinatario: " + (dataTickets?.destinatarios.razonSocial ?? ""))

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Destinatario: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)

            // Asignamos el attributedString al UILabel
            destinataryText.attributedText = attributedString
        } else {
            //No tiene datos
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Destinatario: " + "---- ---- -----")

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Destinatario: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)

            // Asignamos el attributedString al UILabel
            destinataryText.attributedText = attributedString
        }
        
        //MARK: -TELEFONO/CONTACTO-
        if dataTickets?.destinatarios.contacto != nil {
            // Asignamos el telefono/contacto
            var mgson = dataTickets?.destinatarios.contacto
            var inputText5: String?
            
            if mgson == nil || mgson!.isEmpty {
                // Handle the case when mgson is null or empty
                inputText5 = "" // Or any default value you want to assign
            } else {
                do {
                    // Convert the JSON string to Data
                    if let jsonData = mgson!.data(using: .utf8) {
                        // Parse the JSON data into a Dictionary
                        if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            // Check if the JsonObject contains the "Telefono" field
                            if let telefono = jsonObject["Telefono"] as? String {
                                inputText5 = telefono
                            } else {
                                // Handle the case when "Telefono" field is missing or JsonObject is null
                                inputText5 = "" // Or any default value you want to assign
                            }
                        } else {
                            // Handle the case when JsonObject is null
                            inputText5 = "" // Or any default value you want to assign
                        }
                    } else {
                        // Handle the case when JSON data conversion fails
                        inputText5 = "" // Or any default value you want to assign
                    }
                } catch {
                    // Handle JSON parsing exception
                    print("Error parsing JSON: \(error.localizedDescription)")
                    inputText5 = "" // Or any default value you want to assign
                }
            }
            
            //print("Telefono: \(inputText5 ?? "nil")")
            
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Teléfono: " + (inputText5 ?? ""))

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Teléfono: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
            
            // Asignamos el attributedString al UILabel
            contactText.attributedText = attributedString
        } else {
            //No tiene datos
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Teléfono: " + "-- -- -- -- --")

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Teléfono: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
            
            // Asignamos el attributedString al UILabel
            contactText.attributedText = attributedString
        }
        
        //MARK: -DIRECCION-
        /*if dataTickets?.destinatarios.calle != nil {
            // Asignamos el telefono/contacto
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Dirección: " + (dataTickets?.destinatarios.calle ?? ""))

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Dirección: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
            
            // Asignamos el attributedString al UILabel
            addressText.attributedText = attributedString
        } else {
            //No tiene datos
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Dirección: " + "-- -- -- -- --")

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Dirección: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
            
            // Asignamos el attributedString al UILabel
            addressText.attributedText = attributedString
        }*/
        
        //MARK: -REFERENCIAS-
        if dataTickets?.destinatarios.referencia != nil {
            // Asignamos el telefono/contacto
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Referencias: " + (dataTickets?.destinatarios.referencia ?? ""))

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Referencias: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
            
            // Asignamos el attributedString al UILabel
            referencesText.attributedText = attributedString
        } else {
            //No tiene datos
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Referencias: " + "-- -- -- -- --")

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Referencias: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
            
            // Asignamos el attributedString al UILabel
            referencesText.attributedText = attributedString
        }
        
    }
}
