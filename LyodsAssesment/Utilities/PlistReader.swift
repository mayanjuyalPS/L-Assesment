//
//  PlistReader.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation

struct PlistReader {
    
    static var host: String {
        var host = ""
        do {
            host = try Configuration.value(for: "API_Host") as String
        } catch(let error) {
            debugPrint("Error :\(error)")
        }
        return host
    }
    
    
}

enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
