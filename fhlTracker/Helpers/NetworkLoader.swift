//
//  NetworkLoader.swift
//  fhlTracker
//
//  Created by Jose Rivera on 15/03/24.
//

import Foundation
class NetworkLoader {
     @discardableResult static func loadData<T: Codable>(request: URLRequest, completion: @escaping (MyResult<T>) -> Void) -> URLSession {
        let session = URLSession(configuration: .default, delegate: Delegate(), delegateQueue: .main)
        session.dataTask(with: request) { data, _, error  in
            //print("response \(String(describing: response)): \(String(describing: data))")
            if error != nil {
                completion(.failure(error!))
            }
            guard let data = data else { return }
            do {
                let value = try JSONDecoder().decode(T.self, from: data)
                completion(.success(dat: value))
            }catch {
                completion(.failure(error))
            }
        }.resume()
        return session
    }
    
    static func createRequest(url: String, data: [String: Any], method: Method ) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.timeoutInterval = 120
      //  print("the url is \(String(describing: request.url?.absoluteURL))")
        request.httpMethod = method.method
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if method.self == .post {
            if data["codable"] != nil {
                request.httpBody = data["codable"] as? Data
            } else {
                let jsonDict = data
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonDict, options: []) else { return request }
                request.httpBody = jsonData
            }
        }
        return request
    }
    
    //Funcion nueva y especifica para mandar un header(token) en la peticion
    static func createRequestHeader(url: String, data: [String: Any], method: Method, headers: [String: String] = [:]) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.timeoutInterval = 120
        request.httpMethod = method.method
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Agregar encabezados personalizados
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        if method.self == .post {
            if data["codable"] != nil {
                request.httpBody = data["codable"] as? Data
            } else {
                let jsonDict = data
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonDict, options: []) else { return request }
                request.httpBody = jsonData
            }
        }
        return request
    }

}
enum MyResult<T> {
    case success(dat: T)
    case failure(Error)
}
enum Method {
    case post
    case get
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
class Delegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        //#if DEBUG
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
//        #else
//        completionHandler(.performDefaultHandling, nil)
//        #endif
//        print("delegate call")
       // if challenge.protectionSpace.host == "holcimenlinea.com" {
           // completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        //} else {
           // completionHandler(.performDefaultHandling, nil)
        //}
    }
}
