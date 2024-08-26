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
    @IBOutlet weak var referencesText: UILabel!
    
    var dataTickets: DataTicket?
    var statusFinal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Revisamos la data desde un inicio
        if dataTickets != nil {
            //print("DataStatus: ", dataTickets as Any)
            
            //Colocamos la informacion de la data
            folioText.text = dataTickets?.folioTicket
            
            //MARK: -ESTATUS DE TEXTO E IMAGENES-
            let mStatus = dataTickets?.estatusId
            
            switch(mStatus) {
            case 1:
                //statusIdText.text = "El estatus del pedido es : Recolectando"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : En proceso")
                
                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "En proceso")
                
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
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : Cargado")
                
                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Cargado")
                
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
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : " + (statusFinal ?? ""))
                
                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: statusFinal ?? "")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)
                
                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                switch(statusFinal){
                case "En ruta":
                    processStatus.image = UIImage(named: "statusThreeR")
                    break;
                    
                case "En tiempo":
                    processStatus.image = UIImage(named: "statusThreeTiempo")
                    break;
                    
                case "Retrasado":
                    processStatus.image = UIImage(named: "statusThreeRetrasado")
                    break;
                    
                case .none:
                    processStatus.image = UIImage(named: "statusThreeR")
                    break;
                    
                case .some(_):
                    processStatus.image = UIImage(named: "statusThreeR")
                    break;
                }
                
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
                processStatus.image = UIImage(named: "statusFourRed")
                
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
                
            case 9:
                //statusIdText.text = "Transferido"
                
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "El estatus del pedido es : Arribo")
                
                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Arribo")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 12), range: range)
                
                // Asignamos el attributedString al UILabel
                statusIdText.attributedText = attributedString
                
                // Asignamos la imagen
                processStatus.image = UIImage(named: "statusNine")
                
                //Asignamos el estatus de Entrega
                deliveryProcessStatus.text = "Entrega estimada"
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
        func convertToDate(from dateString: String, formats: [String]) -> Date? {
            for format in formats {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = format
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                if let date = dateFormatter.date(from: dateString) {
                    return date
                }
            }
            return nil
        }
        
        // Definir los formatos de entrada
        let inputDateFormats = ["yyyy-MM-dd'T'HH:mm:ss.SSS", "yyyy-MM-dd'T'HH:mm:ss"]
        
        // Obtener la fecha de entrega del dataTickets
        guard let rawFechaPromesaEntrega = dataTickets?.fechaPromesaEntrega else {
            print("Error: La cadena de fecha es nula")
            deliveryDateText.text = "--- --- --- ---"
            return
        }
        
        // Intentar convertir la cadena de fecha a un objeto Date usando los formatos definidos
        guard let dateTime = convertToDate(from: rawFechaPromesaEntrega, formats: inputDateFormats) else {
            print("Error: No se pudo convertir la cadena de fecha a Date")
            deliveryDateText.text = "--- --- --- ---"
            return
        }
        
        // Imprimir la fecha después de la conversión para verificar
        print("Fecha convertida:", dateTime)
        
        // Definir un formateador de fecha personalizado para el formato de salida deseado
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es")
        formatter.dateFormat = "EEEE d 'de' MMMM yyyy"
        
        // Formatear el objeto Date en el formato de salida deseado
        let formattedDate = formatter.string(from: dateTime)
        print(formattedDate)
        
        // Asignar la fecha ya procesada
        deliveryDateText.text = formattedDate
        
        // MARK: -HORA DE ENTREGA APROXIMADA-
        // Formatear la hora de entrega
        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "hh:mm a"
        hourFormatter.amSymbol = "a. m."
        hourFormatter.pmSymbol = "p. m."
        
        // Formatear el objeto Date en el formato de salida deseado
        let formattedHourString = hourFormatter.string(from: dateTime)
        print(formattedHourString)
        
        // Asignar la hora ya procesada
        deliveryHourText.text = formattedHourString
        
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
        // Variables para armar el destinatario
        var ciudad = ""
        var estado = ""
        var pais = ""
        var destinatarioFull = ""
        
        /*if dataTickets?.destinatarios.razonSocial != nil {
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
        }*/
        
        // Ciudad
        if dataTickets?.destinatarios.municipio != nil {
            if dataTickets?.destinatarios.municipio == "" {
                //No tiene datos
                ciudad = "Sin ciudad"
            } else {
                ciudad = dataTickets?.destinatarios.municipio ?? "Sin ciudad"
            }
        } else {
            //No tiene datos
            ciudad = "Sin ciudad"
        }
        
        // Estado
        if dataTickets?.destinatarios.estado != nil {
            if dataTickets?.destinatarios.estado == "" {
                estado = "Sin estado"
            } else {
                estado = dataTickets?.destinatarios.estado ?? "Sin estado"
            }
        } else {
            estado = "Sin estado"
        }
        
        // País
        if dataTickets?.destinatarios.pais != nil {
            if dataTickets?.destinatarios.pais == "" {
                pais = "Sin país"
            } else {
                pais = dataTickets?.destinatarios.pais ?? "Sin país"
            }
        } else {
            pais = "Sin país"
        }
        
        destinatarioFull = ciudad + ", " + estado + ", " + pais
        
        // Asignamos el destinatario
        // Creamos una cadena NSMutableAttributedString
        let attributedString = NSMutableAttributedString(string: "Destinatario: " + destinatarioFull)
        
        // Definimos los atributos de texto para la palabra "Recolectando"
        let range = (attributedString.string as NSString).range(of: "Destinatario: ")
        
        // Aplicamos el estilo "Bond" a la palabra "Recolectando"
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
        
        // Asignamos el attributedString al UILabel
        destinataryText.attributedText = attributedString
        
        //MARK: -TELEFONO/CONTACTO-
        /*if dataTickets?.destinatarios.contacto != nil {
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
                                inputText5 = "-- -- -- -- --" // Or any default value you want to assign
                            }
                        } else {
                            // Handle the case when JsonObject is null
                            inputText5 = "-- -- -- -- --" // Or any default value you want to assign
                        }
                    } else {
                        // Handle the case when JSON data conversion fails
                        inputText5 = "-- -- -- -- --" // Or any default value you want to assign
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
        }*/
        
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
        print(dataTickets?.referencia as Any)
        if dataTickets?.referencia != nil {
            // Asignamos el telefono/contacto
            if dataTickets?.referencia == "" {
                //No tiene datos
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "Referencia: " + "-- -- -- --")

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Referencia: ")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
                
                // Asignamos el attributedString al UILabel
                referencesText.attributedText = attributedString
            } else {
                // Creamos una cadena NSMutableAttributedString
                let attributedString = NSMutableAttributedString(string: "Referencia: " + (dataTickets?.referencia ?? "-- -- -- --"))

                // Definimos los atributos de texto para la palabra "Recolectando"
                let range = (attributedString.string as NSString).range(of: "Referencia: ")
                
                // Aplicamos el estilo "Bond" a la palabra "Recolectando"
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
                
                // Asignamos el attributedString al UILabel
                referencesText.attributedText = attributedString
            }
        } else {
            //No tiene datos
            // Creamos una cadena NSMutableAttributedString
            let attributedString = NSMutableAttributedString(string: "Referencia: " + "-- -- -- --")

            // Definimos los atributos de texto para la palabra "Recolectando"
            let range = (attributedString.string as NSString).range(of: "Referencia: ")
            
            // Aplicamos el estilo "Bond" a la palabra "Recolectando"
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
            
            // Asignamos el attributedString al UILabel
            referencesText.attributedText = attributedString
        }
        
    }
}
