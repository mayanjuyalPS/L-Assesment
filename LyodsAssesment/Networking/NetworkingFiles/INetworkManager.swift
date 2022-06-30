//
//  INetworkManager.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 30/06/22.
//

import Foundation
import PromiseKit

typealias Response = Promise<BaseCodable>

protocol INetworkManager {
    func request<T: BaseCodable>(_ type: T.Type, endPoint: NetworkRequest) -> Response
}
