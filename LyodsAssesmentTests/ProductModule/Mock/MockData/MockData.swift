//
//  MockData.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 01/07/22.
//

import Foundation

struct MockData {
    
    static let product: ProductResponse? = ProductResponse(limit: 1, total: 3,
                                                           products: [Product(title: "ABC",
                                                                              description: "QWERRTTYY",
                                                                              price: 10,
                                                                              thumbnail: ""),
                                                                      Product(title: "ABC",
                                                                              description: "QWERRTTYY",
                                                                              price: 10,
                                                                              thumbnail: ""),
                                                                      Product(title: "ABC",
                                                                              description: "QWERRTTYY",
                                                                              price: 10,
                                                                              thumbnail: "")])
    
}

extension MockData {
    static func mockDictionary() -> Data {
        let encoded = try! JSONEncoder().encode(product)
        return encoded
    }
}
