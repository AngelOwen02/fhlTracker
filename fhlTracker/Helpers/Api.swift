//
//  Api.swift
//  fhlTracker
//
//  Created by Jose Rivera on 15/03/24.
//

import Foundation
struct Api {
    //URL FH
    static let serverFH = "https://sistemasservice.trafficmanager.net"
    
    //URL SGD
    static let serverSGD = "https://administracionsgd.ddns.net:7220"
    
    enum EndPoint {
        //MARK: - LOGIN -
        case login
        
        //MARK: -TICKETS-
        case tickets
        
        var url: String {
            switch self {
            //MARK: -LOGIN-
            case .login:
                return "\(Api.serverFH)/Usuarios/Usuarios/Login"
               
            //MARK: -TICKETS-
            case.tickets:
                return "\(Api.serverSGD)/Despachos/Ticket/GetTicket"
            }
        }
    }
}
