//
//  MockData.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 01/07/22.
//

import Foundation

struct MockData {
    
    static let product: ProductResposne? = ProductResposne(limit: 1, total: 1,
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
