//
//  BeerProvider.swift
//  mvvmc_swiftui
//
//  Created by Dennis Merli on 6/4/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation
import Moya

enum BeerProvider {
    case beerBrewedInPeriod(isAfter: Bool, date: String)
    case beerById(_ beerId: String)
    case beerByName(_ name: String)
}

extension BeerProvider: TargetType {
    var baseURL: URL {
        return NetworkManager.shared.currentBaseURL()
    }
    
    var path: String {
        switch self {
        case .beerBrewedInPeriod(isAfter: _, date: _):
            return "/beers"
        case .beerById(let beerId):
            return "/beers/\(beerId)"
        case .beerByName(name: _):
            return "/beers"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .beerBrewedInPeriod(isAfter: _, date: _):
            return .get
        case .beerById(beerId: _ ):
            return .get
        case .beerByName(name: _):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .beerBrewedInPeriod(isAfter: _, date: _):
            return Data()
        case .beerById(beerId: _ ):
            return Data()
        case .beerByName(name: _):
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .beerBrewedInPeriod(let isAfter, let date):
            var parameters: [String: Any] = [:]
            if isAfter {
                parameters = ["brewed_after": date]
            } else {
                parameters = ["brewed_before": date]
            }
            
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.queryString)
        case .beerById(beerId: _):
            return .requestPlain
        case .beerByName(let name):
            let parameters = ["beer_name": name]
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}




