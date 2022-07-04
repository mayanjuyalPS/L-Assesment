//
//  Users.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

struct ProductDTO: Codable {
    let limit: Int
    let total: Int
    let products: [Product]
}

struct Product: Codable {
    let title: String
    let description: String
    let price: Float
    let thumbnail: String
}
