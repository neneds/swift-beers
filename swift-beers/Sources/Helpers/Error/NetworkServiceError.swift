//
//  NetworkServiceError.swift
//
//  Created by Dennis Merli on 09/04/19.
//

import Foundation
import Moya

class NetworkServiceError: Codable {
    let errorCode: Int?
    let message: String?
    let details: String?
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, details
    }
    
    init(errorCode: Int?, message: String?, details: String?) {
        self.errorCode = errorCode
        self.message = message
        self.details = details
    }
    
    func toError() -> Error {
        return NSError(domain: Bundle.main.bundleID, code: self.errorCode ?? 101, userInfo: [NSLocalizedDescriptionKey: message ?? BaseLocalizable.unknownError])
    }
}

