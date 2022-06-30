//
//  NetworkManager.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import PromiseKit

class NetworkManger: INetworkManager {
    
    func request<T: BaseCodable>(_ type: T.Type, endPoint: NetworkRequest) -> Response {
        return Promise<BaseCodable> { seal in
            let request = createURLRequest(using: endPoint)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
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

extension NetworkManger {
    
    private func createURLRequest(using endPoint: NetworkRequest) -> URLRequest {
        let url = createURL(with: endPoint)
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = endPoint.method.rawValue
        if !endPoint.bodyParamaters.isEmpty {
            let bodyData = try? JSONSerialization.data(withJSONObject: endPoint.bodyParamaters, options: [.prettyPrinted])
            urlRequest.httpBody = bodyData
        }
        endPoint.headerParamaters.forEach({ key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })
        return urlRequest
    }
    
    private func createURL(with endPoint: NetworkRequest) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = PlistReader.host
        components.path = endPoint.path
        components.queryItems = endPoint.queryParameters.map {
            URLQueryItem(name: $0, value: "\($1)")
        }
        return components.url!
    }
    
}
