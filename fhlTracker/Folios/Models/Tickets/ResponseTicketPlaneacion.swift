//
//  ResponseTicketPlaneacion.swift
//  fhlTracker
//
//  Created by Jose Rivera on 11/07/24.
//

import Foundation

struct ResponseTicketPlaneacion: Codable {
    let timeMeasure: TimeMeasure?
    let totalRows: Int?
    let status: Int?
    let message: String?
    let data: [DataTicketPlaneacion]?
    let function: String?
    let sTiempos: String?
    
    enum CodingKeys: String, CodingKey {
        case timeMeasure = "timeMeasure"
        case totalRows = "TotalRows"
        case status = "Status"
        case message = "Message"
        case data = "Data"
        case function = "Function"
        case sTiempos = "sTiempos"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        timeMeasure = try container.decodeIfPresent(TimeMeasure.self, forKey: .timeMeasure)
        totalRows = try container.decodeIfPresent(Int.self, forKey: .totalRows)
        status = try container.decodeIfPresent(Int.self, forKey: .status)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        data = try container.decodeIfPresent([DataTicketPlaneacion].self, forKey: .data)
        function = try container.decodeIfPresent(String.self, forKey: .function)
        sTiempos = try container.decodeIfPresent(String.self, forKey: .sTiempos)
    }
}

struct TimeMeasure: Codable {
    let isRunning: Bool?
    let elapsed: String?
    let elapsedMilliseconds: Int?
    let elapsedTicks: Int?
    
    enum CodingKeys: String, CodingKey {
        case isRunning = "IsRunning"
        case elapsed = "Elapsed"
        case elapsedMilliseconds = "ElapsedMilliseconds"
        case elapsedTicks = "ElapsedTicks"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isRunning = try container.decodeIfPresent(Bool.self, forKey: .isRunning)
        self.elapsed = try container.decodeIfPresent(String.self, forKey: .elapsed)
        self.elapsedMilliseconds = try container.decodeIfPresent(Int.self, forKey: .elapsedMilliseconds)
        self.elapsedTicks = try container.decodeIfPresent(Int.self, forKey: .elapsedTicks)
    }
}

struct DataTicketPlaneacion: Codable {
    let id: Int?
    let folioTicket: String?
    let tipoSolicitudId: Int?
    let empaque: String?
    let fechaPromesaLlegada: String?
    let etaDestino: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case folioTicket = "FolioTicket"
        case tipoSolicitudId = "TipoSolicitudId"
        case empaque = "Empaque"
        case fechaPromesaLlegada = "FechaPromesaLlegada"
        case etaDestino = "EtaDestino"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.folioTicket = try container.decodeIfPresent(String.self, forKey: .folioTicket)
        self.tipoSolicitudId = try container.decodeIfPresent(Int.self, forKey: .tipoSolicitudId)
        self.empaque = try container.decodeIfPresent(String.self, forKey: .empaque)
        self.fechaPromesaLlegada = try container.decodeIfPresent(String.self, forKey: .fechaPromesaLlegada)
        self.etaDestino = try container.decodeIfPresent(String.self, forKey: .etaDestino)
    }
}
