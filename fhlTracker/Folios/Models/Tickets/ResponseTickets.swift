//
//  ResponseTickets.swift
//  fhlTracker
//
//  Created by Jose Rivera on 19/03/24.
//

import Foundation

struct ResponseTickets: Codable {
    let totalRows: Int?
    let pageIndex: Int?
    let pageSize: Int?
    let status: Int?
    let message: String?
    let data: DataTicket?
    let function: String?
    let parameters: String? //Revisar/ Any
    let sTiempos: String?
    
    enum CodingKeys: String, CodingKey {
        case totalRows = "totalRows"
        case pageIndex = "pageIndex"
        case pageSize = "pageSize"
        case status = "status"
        case message = "message"
        case data = "data"
        case function = "function"
        case parameters = "parameters"
        case sTiempos = "sTiempos"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalRows = try container.decodeIfPresent(Int.self, forKey: .totalRows)
        pageIndex = try container.decodeIfPresent(Int.self, forKey: .pageIndex)
        pageSize = try container.decodeIfPresent(Int.self, forKey: .pageSize)
        status = try container.decodeIfPresent(Int.self, forKey: .status)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        data = try container.decodeIfPresent(DataTicket.self, forKey: .data)
        function = try container.decodeIfPresent(String.self, forKey: .function)
        parameters = try container.decodeIfPresent(String.self, forKey: .parameters)
        sTiempos = try container.decodeIfPresent(String.self, forKey: .sTiempos)
        }
}

struct DataTicket: Codable {
    let folioTicket: String?
    let folioTicketWMS: String?
    let tipoFolio: String?
    let origen: String?
    let clienteId: Int?
    let destinatariosId: Int?
    let referencia: String?
    let solicitaServicio: String?
    let fechaSolicitud: String?
    let tipoSolicitudId: Int?
    let tipoEntregaId: Int?
    let estatusId: Int?
    let comentarios: String?
    let tipoRecepcion: String? //Revisar/Any
    let secuencia: String?
    let fechaPromesaLlegadaOrigen: String?
    let fechaSalidaEstimada: String? //Revisar/Any
    let fechaPromesaCarga: String?
    let fechaPromesaEntrega: String?
    let fechaPromesaRetorno: String?
    let tiempoCarga: String?
    let tiempoParadaDestino: String?
    let fechaVentanaInicio: String?
    let fechaVentanaFin: String?
    let fechaRestriccionCirculacionInicio: String?
    let fechaRestriccionCirculacionFin: String?
    let empaque: String?
    let rutaId: Int?
    let tipoVehiculoId: Int?
    let habilidadesVehiculo: String?
    let documentosVehiculo: String?
    let habilidadesOperador: String?
    let documentosOperador: String?
    let habilidadesAuxiliar: String?
    let documentosAuxiliar: String?
    let evidenciaSalida: String?
    let evidenciaLlegada: String?
    let checkList: String?
    let maniobras: Int?
    let peligroso: String?
    let custodia: String?
    let custodiaArmada: String?
    let tipoCustodiaId: Int?
    let prioridadId: Int? //Revisar/Any
    let requiereEvidenciaSeguroSocial: String?
    let seguro: Bool?
    let servicioCobro: Bool?
    let servicioAdicional: String?
    let recepcionTicket: String? //Revisar/Any
    let asignacionManifiesto: Int? //Revisar/Any
    let inicioEscaneoRecepcionProducto: String? //Revisar/Any
    let finEscaneoRecepcionProducto: String? //Revisar/Any
    let inicioEntregaProducto: String? //Revisar/Any
    let finEntregaProducto: String? //Revisar/Any
    let usuario: String?
    let cliente: Cliente?
    let destinatarios: Destinatarios
    let tipoVehiculo: TipoVehiculo
    let ruta: Ruta
    let tipoCustodia: TipoCustodia
    let destinatariosClienteId: Int? //Revisar/Any
    let cantidad: Int?
    let sumaAsegurada: Float?
    let seguroId: Int? //Revisar/Any
    let id: Int?
    let trail: String?
    let fechaCreacion: String?
    let eliminado: Bool?
    let esNuevo: Bool?
    
    enum CodingKeys: String, CodingKey {
        case folioTicket = "folioTicket"
        case folioTicketWMS = "folioTicketWMS"
        case tipoFolio = "tipoFolio"
        case origen = "origen"
        case clienteId = "clienteId"
        case destinatariosId = "destinatariosId"
        case referencia = "referencia"
        case solicitaServicio = "solicitaServicio"
        case fechaSolicitud = "fechaSolicitud"
        case tipoSolicitudId = "tipoSolicitudId"
        case tipoEntregaId = "tipoEntregaId"
        case estatusId = "estatusId"
        case comentarios = "comentarios"
        case tipoRecepcion = "tipoRecepcion"
        case secuencia = "secuencia"
        case fechaPromesaLlegadaOrigen = "fechaPromesaLlegadaOrigen"
        case fechaSalidaEstimada = "fechaSalidaEstimada"
        case fechaPromesaCarga = "fechaPromesaCarga"
        case fechaPromesaEntrega = "fechaPromesaEntrega"
        case fechaPromesaRetorno = "fechaPromesaRetorno"
        case tiempoCarga = "tiempoCarga"
        case tiempoParadaDestino = "tiempoParadaDestino"
        case fechaVentanaInicio = "fechaVentanaInicio"
        case fechaVentanaFin = "fechaVentanaFin"
        case fechaRestriccionCirculacionInicio = "fechaRestriccionCirculacionInicio"
        case fechaRestriccionCirculacionFin = "fechaRestriccionCirculacionFin"
        case empaque = "empaque"
        case rutaId = "rutaId"
        case tipoVehiculoId = "tipoVehiculoId"
        case habilidadesVehiculo = "habilidadesVehiculo"
        case documentosVehiculo = "documentosVehiculo"
        case habilidadesOperador = "habilidadesOperador"
        case documentosOperador = "documentosOperador"
        case habilidadesAuxiliar = "habilidadesAuxiliar"
        case documentosAuxiliar = "documentosAuxiliar"
        case evidenciaSalida = "evidenciaSalida"
        case evidenciaLlegada = "evidenciaLlegada"
        case checkList = "checkList"
        case maniobras = "maniobras"
        case peligroso = "peligroso"
        case custodia = "custodia"
        case custodiaArmada = "custodiaArmada"
        case tipoCustodiaId = "tipoCustodiaId"
        case prioridadId = "prioridadId"
        case requiereEvidenciaSeguroSocial = "requiereEvidenciaSeguroSocial"
        case seguro = "seguro"
        case servicioCobro = "servicioCobro"
        case servicioAdicional = "servicioAdicional"
        case recepcionTicket = "recepcionTicket"
        case asignacionManifiesto = "asignacionManifiesto"
        case inicioEscaneoRecepcionProducto = "inicioEscaneoRecepcionProducto"
        case finEscaneoRecepcionProducto = "finEscaneoRecepcionProducto"
        case inicioEntregaProducto = "inicioEntregaProducto"
        case finEntregaProducto = "finEntregaProducto"
        case usuario = "usuario"
        case cliente = "cliente"
        case destinatarios = "destinatarios"
        case tipoVehiculo = "tipoVehiculo"
        case ruta = "ruta"
        case tipoCustodia = "tipoCustodia"
        case destinatariosClienteId = "destinatariosClienteId"
        case cantidad = "cantidad"
        case sumaAsegurada = "sumaAsegurada"
        case seguroId = "seguroId"
        case id = "id"
        case trail = "trail"
        case fechaCreacion = "fechaCreacion"
        case eliminado = "eliminado"
        case esNuevo = "esNuevo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        folioTicket = try container.decodeIfPresent(String.self, forKey: .folioTicket)
        folioTicketWMS = try container.decodeIfPresent(String.self, forKey: .folioTicketWMS)
        tipoFolio = try container.decodeIfPresent(String.self, forKey: .tipoFolio)
        origen = try container.decodeIfPresent(String.self, forKey: .origen)
        clienteId = try container.decodeIfPresent(Int.self, forKey: .clienteId)
        destinatariosId = try container.decodeIfPresent(Int.self, forKey: .destinatariosId)
        referencia = try container.decodeIfPresent(String.self, forKey: .referencia)
        solicitaServicio = try container.decodeIfPresent(String.self, forKey: .solicitaServicio)
        fechaSolicitud = try container.decodeIfPresent(String.self, forKey: .fechaSolicitud)
        tipoSolicitudId = try container.decodeIfPresent(Int.self, forKey: .tipoSolicitudId)
        tipoEntregaId = try container.decodeIfPresent(Int.self, forKey: .tipoEntregaId)
        estatusId = try container.decodeIfPresent(Int.self, forKey: .estatusId)
        comentarios = try container.decodeIfPresent(String.self, forKey: .comentarios)
        tipoRecepcion = try container.decodeIfPresent(String.self, forKey: .tipoRecepcion)
        secuencia = try container.decodeIfPresent(String.self, forKey: .secuencia)
        fechaPromesaLlegadaOrigen = try container.decodeIfPresent(String.self, forKey: .fechaPromesaLlegadaOrigen)
        fechaSalidaEstimada = try container.decodeIfPresent(String.self, forKey: .fechaSalidaEstimada)
        fechaPromesaCarga = try container.decodeIfPresent(String.self, forKey: .fechaPromesaCarga)
        fechaPromesaEntrega = try container.decodeIfPresent(String.self, forKey: .fechaPromesaEntrega)
        fechaPromesaRetorno = try container.decodeIfPresent(String.self, forKey: .fechaPromesaRetorno)
        tiempoCarga = try container.decodeIfPresent(String.self, forKey: .tiempoCarga)
        tiempoParadaDestino = try container.decodeIfPresent(String.self, forKey: .tiempoParadaDestino)
        fechaVentanaInicio = try container.decodeIfPresent(String.self, forKey: .fechaVentanaInicio)
        fechaVentanaFin = try container.decodeIfPresent(String.self, forKey: .fechaVentanaFin)
        fechaRestriccionCirculacionInicio = try container.decodeIfPresent(String.self, forKey: .fechaRestriccionCirculacionInicio)
        fechaRestriccionCirculacionFin = try container.decodeIfPresent(String.self, forKey: .fechaRestriccionCirculacionFin)
        empaque = try container.decodeIfPresent(String.self, forKey: .empaque)
        rutaId = try container.decodeIfPresent(Int.self, forKey: .rutaId)
        tipoVehiculoId = try container.decodeIfPresent(Int.self, forKey: .tipoVehiculoId)
        habilidadesVehiculo = try container.decodeIfPresent(String.self, forKey: .habilidadesVehiculo)
        documentosVehiculo = try container.decodeIfPresent(String.self, forKey: .documentosVehiculo)
        habilidadesOperador = try container.decodeIfPresent(String.self, forKey: .habilidadesOperador)
        documentosOperador = try container.decodeIfPresent(String.self, forKey: .documentosOperador)
        habilidadesAuxiliar = try container.decodeIfPresent(String.self, forKey: .habilidadesAuxiliar)
        documentosAuxiliar = try container.decodeIfPresent(String.self, forKey: .documentosAuxiliar)
        evidenciaSalida = try container.decodeIfPresent(String.self, forKey: .evidenciaSalida)
        evidenciaLlegada = try container.decodeIfPresent(String.self, forKey: .evidenciaLlegada)
        checkList = try container.decodeIfPresent(String.self, forKey: .checkList)
        maniobras = try container.decodeIfPresent(Int.self, forKey: .maniobras)
        peligroso = try container.decodeIfPresent(String.self, forKey: .peligroso)
        custodia = try container.decodeIfPresent(String.self, forKey: .custodia)
        custodiaArmada = try container.decodeIfPresent(String.self, forKey: .custodiaArmada)
        tipoCustodiaId = try container.decodeIfPresent(Int.self, forKey: .tipoCustodiaId)
        prioridadId = try container.decodeIfPresent(Int.self, forKey: .prioridadId)
        requiereEvidenciaSeguroSocial = try container.decodeIfPresent(String.self, forKey: .requiereEvidenciaSeguroSocial)
        seguro = try container.decodeIfPresent(Bool.self, forKey: .seguro)
        servicioCobro = try container.decodeIfPresent(Bool.self, forKey: .servicioCobro)
        servicioAdicional = try container.decodeIfPresent(String.self, forKey: .servicioAdicional)
        recepcionTicket = try container.decodeIfPresent(String.self, forKey: .recepcionTicket)
        asignacionManifiesto = try container.decodeIfPresent(Int.self, forKey: .asignacionManifiesto)
        inicioEscaneoRecepcionProducto = try container.decodeIfPresent(String.self, forKey: .inicioEscaneoRecepcionProducto)
        finEscaneoRecepcionProducto = try container.decodeIfPresent(String.self, forKey: .finEscaneoRecepcionProducto)
        inicioEntregaProducto = try container.decodeIfPresent(String.self, forKey: .inicioEntregaProducto)
        finEntregaProducto = try container.decodeIfPresent(String.self, forKey: .finEntregaProducto)
        usuario = try container.decodeIfPresent(String.self, forKey: .usuario)
        cliente = try container.decodeIfPresent(Cliente.self, forKey: .cliente)
        destinatarios = try container.decode(Destinatarios.self, forKey: .destinatarios)
        tipoVehiculo = try container.decode(TipoVehiculo.self, forKey: .tipoVehiculo)
        ruta = try container.decode(Ruta.self, forKey: .ruta)
        tipoCustodia = try container.decode(TipoCustodia.self, forKey: .tipoCustodia)
        destinatariosClienteId = try container.decodeIfPresent(Int.self, forKey: .destinatariosClienteId)
        cantidad = try container.decodeIfPresent(Int.self, forKey: .cantidad)
        sumaAsegurada = try container.decodeIfPresent(Float.self, forKey: .sumaAsegurada)
        seguroId = try container.decodeIfPresent(Int.self, forKey: .seguroId)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        trail = try container.decodeIfPresent(String.self, forKey: .trail)
        fechaCreacion = try container.decodeIfPresent(String.self, forKey: .fechaCreacion)
        eliminado = try container.decodeIfPresent(Bool.self, forKey: .eliminado)
        esNuevo = try container.decodeIfPresent(Bool.self, forKey: .esNuevo)
    }
}

struct Cliente: Codable {
    let razonSocial: String?
    let rfc: String?
    let axaptaId: String?
    let usuario: String?
    let id: Int?
    let trail: String?
    let fechaCreacion: String?
    let eliminado: Bool?
    let esNuevo: Bool
    
    enum CodingKeys: String, CodingKey {
        case razonSocial = "razonSocial"
        case rfc = "rfc"
        case axaptaId = "axaptaId"
        case usuario = "usuario"
        case id = "id"
        case trail = "trail"
        case fechaCreacion = "fechaCreacion"
        case eliminado = "eliminado"
        case esNuevo = "esNuevo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.razonSocial = try container.decodeIfPresent(String.self, forKey: .razonSocial)
        self.rfc = try container.decodeIfPresent(String.self, forKey: .rfc)
        self.axaptaId = try container.decodeIfPresent(String.self, forKey: .axaptaId)
        self.usuario = try container.decodeIfPresent(String.self, forKey: .usuario)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.trail = try container.decodeIfPresent(String.self, forKey: .trail)
        self.fechaCreacion = try container.decodeIfPresent(String.self, forKey: .fechaCreacion)
        self.eliminado = try container.decodeIfPresent(Bool.self, forKey: .eliminado)
        self.esNuevo = try container.decode(Bool.self, forKey: .esNuevo)
    }
}


struct Destinatarios: Codable {
    let clienteId: Int?
    let razonSocial: String?
    let rfc: String?
    let axaptaId: Int? // Asumiendo que puede ser de varios tipos
    let referencia: String?
    let calle: String?
    let numeroExterior: String?
    let numeroInterior: String?
    let colonia: String? // Asumiendo que puede ser de varios tipos
    let localidad: String? // Asumiendo que puede ser de varios tipos
    let municipio: String? // Asumiendo que puede ser de varios tipos
    let estado: String? // Asumiendo que puede ser de varios tipos
    let pais: String? // Asumiendo que puede ser de varios tipos
    let codigoPostal: Int?
    let coordenadas: String? // Asumiendo que puede ser de varios tipos
    let recepcionCita: Bool?
    let ventanaAtencion: String?
    let restriccionCirculacion: String?
    let habilidadVehiculo: String?
    let documentoVehiculo: String?
    let habilidadOperador: String?
    let documentoOperador: String?
    let habilidadAuxiliar: String?
    let documentoAuxiliar: String?
    let evidenciaSalida: String?
    let evidenciaLlegada: String?
    let sellos: Bool?
    let checklist: String?
    let contacto: String?
    let geolocalizacion: String?
    let tiempoParado: Int?
    let usuario: String?
    let id: Int?
    let trail: String?
    let fechaCreacion: String?
    let eliminado: Bool?
    let esNuevo: Bool?
    
    enum CodingKeys: String, CodingKey {
        case clienteId = "clienteId"
        case razonSocial = "razonSocial"
        case rfc = "rfc"
        case axaptaId = "axaptaId"
        case referencia = "referencia"
        case calle = "calle"
        case numeroExterior = "numeroExterior"
        case numeroInterior = "numeroInterior"
        case colonia = "colonia"
        case localidad = "localidad"
        case municipio = "municipio"
        case estado = "estado"
        case pais = "pais"
        case codigoPostal = "codigoPostal"
        case coordenadas = "coordenadas"
        case recepcionCita = "recepcionCita"
        case ventanaAtencion = "ventanaAtencion"
        case restriccionCirculacion = "restriccionCirculacion"
        case habilidadVehiculo = "habilidadVehiculo"
        case documentoVehiculo = "documentoVehiculo"
        case habilidadOperador = "habilidadOperador"
        case documentoOperador = "documentoOperador"
        case habilidadAuxiliar = "habilidadAuxiliar"
        case documentoAuxiliar = "documentoAuxiliar"
        case evidenciaSalida = "evidenciaSalida"
        case evidenciaLlegada = "evidenciaLlegada"
        case sellos = "sellos"
        case checklist = "checklist"
        case contacto = "contacto"
        case geolocalizacion = "geolocalizacion"
        case tiempoParado = "tiempoParado"
        case usuario = "usuario"
        case id = "id"
        case trail = "trail"
        case fechaCreacion = "fechaCreacion"
        case eliminado = "eliminado"
        case esNuevo = "esNuevo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        clienteId = try container.decodeIfPresent(Int.self, forKey: .clienteId)
        razonSocial = try container.decodeIfPresent(String.self, forKey: .razonSocial)
        rfc = try container.decodeIfPresent(String.self, forKey: .rfc)
        axaptaId = try container.decodeIfPresent(Int.self, forKey: .axaptaId)
        referencia = try container.decodeIfPresent(String.self, forKey: .referencia)
        calle = try container.decodeIfPresent(String.self, forKey: .calle)
        numeroExterior = try container.decodeIfPresent(String.self, forKey: .numeroExterior)
        numeroInterior = try container.decodeIfPresent(String.self, forKey: .numeroInterior)
        colonia = try container.decodeIfPresent(String.self, forKey: .colonia)
        localidad = try container.decodeIfPresent(String.self, forKey: .localidad)
        municipio = try container.decodeIfPresent(String.self, forKey: .municipio)
        estado = try container.decodeIfPresent(String.self, forKey: .estado)
        pais = try container.decodeIfPresent(String.self, forKey: .pais)
        codigoPostal = try container.decodeIfPresent(Int.self, forKey: .codigoPostal)
        coordenadas = try container.decodeIfPresent(String.self, forKey: .coordenadas)
        recepcionCita = try container.decodeIfPresent(Bool.self, forKey: .recepcionCita)
        ventanaAtencion = try container.decodeIfPresent(String.self, forKey: .ventanaAtencion)
        restriccionCirculacion = try container.decodeIfPresent(String.self, forKey: .restriccionCirculacion)
        habilidadVehiculo = try container.decodeIfPresent(String.self, forKey: .habilidadVehiculo)
        documentoVehiculo = try container.decodeIfPresent(String.self, forKey: .documentoVehiculo)
        habilidadOperador = try container.decodeIfPresent(String.self, forKey: .habilidadOperador)
        documentoOperador = try container.decodeIfPresent(String.self, forKey: .documentoOperador)
        habilidadAuxiliar = try container.decodeIfPresent(String.self, forKey: .habilidadAuxiliar)
        documentoAuxiliar = try container.decodeIfPresent(String.self, forKey: .documentoAuxiliar)
        evidenciaSalida = try container.decodeIfPresent(String.self, forKey: .evidenciaSalida)
        evidenciaLlegada = try container.decodeIfPresent(String.self, forKey: .evidenciaLlegada)
        sellos = try container.decodeIfPresent(Bool.self, forKey: .sellos)
        checklist = try container.decodeIfPresent(String.self, forKey: .checklist)
        contacto = try container.decodeIfPresent(String.self, forKey: .contacto)
        geolocalizacion = try container.decodeIfPresent(String.self, forKey: .geolocalizacion)
        tiempoParado = try container.decodeIfPresent(Int.self, forKey: .tiempoParado)
        usuario = try container.decodeIfPresent(String.self, forKey: .usuario)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        trail = try container.decodeIfPresent(String.self, forKey: .trail)
        fechaCreacion = try container.decodeIfPresent(String.self, forKey: .fechaCreacion)
        eliminado = try container.decodeIfPresent(Bool.self, forKey: .eliminado)
        esNuevo = try container.decodeIfPresent(Bool.self, forKey: .esNuevo)
    }

}

struct TipoVehiculo: Codable {
    let nombre: String?
    let usuario: String?
    let id: Int?
    let trail: String?
    let fechaCreacion: String?
    let eliminado: Bool?
    let esNuevo: Bool?
    
    enum CodingKeys: String, CodingKey {
        case nombre = "nombre"
        case usuario = "usuario"
        case id = "id "
        case trail = "trail"
        case fechaCreacion = "fechaCreacion"
        case eliminado = "eliminado"
        case esNuevo = "esNuevo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.nombre = try container.decodeIfPresent(String.self, forKey: .nombre)
        self.usuario = try container.decodeIfPresent(String.self, forKey: .usuario)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.trail = try container.decodeIfPresent(String.self, forKey: .trail)
        self.fechaCreacion = try container.decodeIfPresent(String.self, forKey: .fechaCreacion)
        self.eliminado = try container.decodeIfPresent(Bool.self, forKey: .eliminado)
        self.esNuevo = try container.decodeIfPresent(Bool.self, forKey: .esNuevo)
    }
}

struct Ruta: Codable {
    let nombre: String?
    let usuario: String?
    let id: Int?
    let trail: String?
    let fechaCreacion: String?
    let eliminado: Bool?
    let esNuevo: Bool?
    
    enum CodingKeys: String, CodingKey {
        case nombre = "nombre"
        case usuario = "usuario"
        case id = "id "
        case trail = "trail"
        case fechaCreacion = "fechaCreacion"
        case eliminado = "eliminado"
        case esNuevo = "esNuevo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.nombre = try container.decodeIfPresent(String.self, forKey: .nombre)
        self.usuario = try container.decodeIfPresent(String.self, forKey: .usuario)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.trail = try container.decodeIfPresent(String.self, forKey: .trail)
        self.fechaCreacion = try container.decodeIfPresent(String.self, forKey: .fechaCreacion)
        self.eliminado = try container.decodeIfPresent(Bool.self, forKey: .eliminado)
        self.esNuevo = try container.decodeIfPresent(Bool.self, forKey: .esNuevo)
    }
}

struct TipoCustodia: Codable {
    let nombre: String?
    let usuario: String?
    let id: Int?
    let trail: String?
    let fechaCreacion: String?
    let eliminado: Bool?
    let esNuevo: Bool?
    
    enum CodingKeys: String, CodingKey {
        case nombre = "nombre"
        case usuario = "usuario"
        case id = "id "
        case trail = "trail"
        case fechaCreacion = "fechaCreacion"
        case eliminado = "eliminado"
        case esNuevo = "esNuevo"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.nombre = try container.decodeIfPresent(String.self, forKey: .nombre)
        self.usuario = try container.decodeIfPresent(String.self, forKey: .usuario)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.trail = try container.decodeIfPresent(String.self, forKey: .trail)
        self.fechaCreacion = try container.decodeIfPresent(String.self, forKey: .fechaCreacion)
        self.eliminado = try container.decodeIfPresent(Bool.self, forKey: .eliminado)
        self.esNuevo = try container.decodeIfPresent(Bool.self, forKey: .esNuevo)
    }
}
