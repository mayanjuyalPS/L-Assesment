//
//  INetworkManager.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 30/06/22.
//

import Foundation
import PromiseKit

typealias Response<T> = Promise<T>
typealias ProductResponse = Promise<ProductDTO>

protocol INetworkManager {
    func request<T: Codable>(_ type: T.Type, endPoint: INetworkRequest) -> Response<T>
}
