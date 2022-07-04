//
//  NetworkManager.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import PromiseKit

class NetworkManger: INetworkManager {
    
    private let requestCreator: URLRequestCreator!
    private let session: URLSession
    
    init(requestCreator: URLRequestCreator, session: URLSession = .shared) {
        self.requestCreator = requestCreator
        self.session = session
    }
    
    func request<T: Codable>(_ type: T.Type, endPoint: INetworkRequest) -> Response<T> {
        return Promise { seal in
            var request: URLRequest!
            do {
                request = try requestCreator.createURLRequest(using: endPoint)
            } catch {
                seal.reject(error)
                return
            }
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    seal.reject(error)
                } else {
                    do {
                        let decodedObject = try JSONDecoder().decode(type, from: data!)
                        seal.fulfill(decodedObject)
                    } catch {
                        seal.reject(error)
                    }
                }
            }
            task.resume()
        }
    }
}
