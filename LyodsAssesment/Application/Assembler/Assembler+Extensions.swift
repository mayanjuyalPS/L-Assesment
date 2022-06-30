//
//  Assembler+Extensions.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import Swinject

extension Assembler {
    
    static var type: AssemblerType = .live
    
    static let sharedAssembler: Assembler = {
        let container = Container()
        
        let assembler = Assembler([ViewControllerAssembly(),
                                   ViewModelAssembly(),
                                   UseCaseAssembly(),
                                   RepositoryAssembly(),
                                   ServiceAssembly(),
                                   NetworkAssembly()],
                                  container: container)
        
        return assembler
    }()
}

enum AssemblerType {
    case live
    case test
}
