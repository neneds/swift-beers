//
//  EnvironmentVariablesLoader.swift
//
//  Created by Dennis Merli on 4/10/19.
//
import Foundation

class EnvironmentVariablesLoader {
    
    private var fileName: String!
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func loadFromPlist() throws -> EnvironmentVariables {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "plist") else {
            throw(CustomError.nilParameter(parameter: "Could not load plist file"))
        }
        
        do {
            let data = try Data(contentsOf: url)
            let plistDecoder = PropertyListDecoder()
            let decodedVars = try plistDecoder.decode(EnvironmentVariables.self, from: data)
            return decodedVars
        } catch {
            throw(error)
        }
    }
}
