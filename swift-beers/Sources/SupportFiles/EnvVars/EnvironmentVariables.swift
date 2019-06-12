//
//  EnvironmentVariables.swift
//
//  Created by Dennis Merli on 4/10/19.
//

import Foundation

class EnvironmentVariables: Decodable {
    let apiProviderDev: APIProvider?
    let apiProviderProd: APIProvider?
    
    init(apiProviderDev: APIProvider?, apiProviderProd: APIProvider?) {
        self.apiProviderDev = apiProviderDev
        self.apiProviderProd = apiProviderProd
    }
}

class APIProvider: Codable {
    let domain: String?
    let apiVersion: String?
    let apiKey: String?
    
    init(domain: String?, apiVersion: String?, apiKey: String?) {
        self.domain = domain
        self.apiVersion = apiVersion
        self.apiKey = apiKey
    }
}
