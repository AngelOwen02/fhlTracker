//
//  ResponseLogin.swift
//  fhlTracker
//
//  Created by Jose Rivera on 19/03/24.
//

import Foundation

struct ResponseLogin: Codable {
    let token: String?
    let expiration: String?
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case expiration = "expiration"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try container.decodeIfPresent(String.self, forKey: .token)
        self.expiration = try container.decodeIfPresent(String.self, forKey: .expiration)
    }
}
