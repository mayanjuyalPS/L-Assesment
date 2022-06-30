//
//  NetworkClient.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 30/06/22.
//

import Foundation

final class NetworkClient {
    
    static var manager: INetworkManager!
    
    init(manager: INetworkManager) {
        NetworkClient.manager = manager
    }
    
    class func request<T: BaseCodable>(_ type: T.Type, endPoint: NetworkRequest) -> Response {
        manager.request(type, endPoint: endPoint)
    }
}
