//
//  AppDIContainer.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 04/07/22.
//

import Foundation
import UIKit

class AppContainer {
    
    lazy var networkManager: INetworkManager = {
       let networkManager = NetworkManger(requestCreator: URLRequestCreator())
        return networkManager
    }()
    
    // Starting app here only we could separate out the Files if we need
    
    func startApp(on window: UIWindow?) {
        let diContainer = ProductModule(networkManager: networkManager)
        let controller = diContainer.createProductViewController()
        let nvc: UINavigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
    }
    
}
