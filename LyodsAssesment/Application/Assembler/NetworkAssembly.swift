//
//  NetworkAssembly.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 30/06/22.
//

import Foundation
import Swinject

class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(INetworkManager.self) { _ in
            return NetworkManger()
        }.inObjectScope(.container)
        
        container.register(NetworkClient.self) { r in
            return NetworkClient(manager: r.resolve(INetworkManager.self)!)
        }
    }
    
}
