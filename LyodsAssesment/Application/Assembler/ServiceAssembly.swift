//
//  ServiceAssembly.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import Swinject

class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(IProductService.self) { _ in
            if Assembler.type == .test {
                return MockServiceTest()
            }
            return ProductServiceImpl()
        }.inObjectScope(.transient)
    }
}
