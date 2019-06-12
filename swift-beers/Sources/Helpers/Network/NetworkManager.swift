//
//  NetworkManager.swift
//
//  Created by Dennis Merli on 4/10/19.
//

import Foundation
import Moya

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
        loadEnvVars()
    }
    
    private var envVars: EnvironmentVariables!
    var isMoyaOnVerboseMode: Bool = false
    
    // MARK: Environment Variables
    var currentNetworkOperationMode: NetworkOperationMode! {
        if ProjectUtils.isRunningTests() {
            return .stubResponse
        } else {
            return .normal
        }
    }
    
    private func loadEnvVars() {
        let loader = EnvironmentVariablesLoader(fileName: "Variables")
        do {
            let result = try loader.loadFromPlist()
            self.envVars = result
        } catch {
            fatalError("Could not load environment variables: \(error.localizedDescription)")
        }
    }
    
    func currentBaseURL() -> URL {
        
        guard let provider = getCurrentProvider() else {
            return URL(string: "www.google.com")!
        }
        
        guard var domain = provider.domain, let version = provider.apiVersion else {
            return URL(string: "www.google.com")!
        }
        
        domain.append("/")
        domain.append(version)
        return URL(string: domain)!
    }
    
    func currentAPIKey() -> String {
        guard let provider = getCurrentProvider() else {
            return ""
        }
        guard let apiKey = provider.apiKey else {
            return ""
        }
        
        return apiKey
    }

    // MARK: Moya configuration
    func createMoyaPlugins() -> [PluginType] {
        var plugins: [PluginType] = []
        plugins.append(createAuthPlugin())
        if isMoyaOnVerboseMode {
            plugins.append(NetworkLoggerPlugin(verbose: true))
        }
        return plugins
    }
    
    func handleMoyaError(_ error: Error, response: Moya.Response) -> Error {
        if let networkError = try? JSONDecoder().decode(NetworkServiceError.self, from: response.data) {
            return networkError.toError()
        } else {
            return CustomError.errorFromService(with: response)
        }
    }
    

    
    private func  getCurrentProvider() -> APIProvider? {
        // for now only using dev, here we must use variables from production/dev to control wich on return
        return envVars.apiProviderDev
    }
    
    private func createAuthPlugin() -> AccessTokenPlugin {
        return AccessTokenPlugin(tokenClosure: { () -> String in
             return ""
        })
    }
}

