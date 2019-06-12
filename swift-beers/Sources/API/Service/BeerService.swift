//
//  BeerService.swift
//  mvvmc_swiftui
//
//  Created by Dennis Merli on 6/4/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Moya
import RxSwift

protocol BeerServiceType {
    func beerBrewedInPeriod(isAfter: Bool, date: String?) -> Single<[BeerResponseElement]>
    func beerById(_ beerId: String?) -> Single<BeerResponseElement>
    func beerByName(_ name: String?) -> Single<BeerResponseElement>
}

final class BeerService: BaseNetworkService<BeerProvider> {
    func beerBrewedInPeriod(isAfter: Bool, date: String?) -> Single<[BeerResponseElement]> {
        guard let date = date else {
            return Single.error(CustomError.nilParameter(parameter: "Date"))
        }
        return provider.rx
            .request(.beerBrewedInPeriod(isAfter: isAfter, date: date))
            .flatMap({ (response) -> Single<[BeerResponseElement]> in
                do {
                    try _ = response.filterSuccessfulStatusCodes()
                    let beers = try JSONDecoder().decode([BeerResponseElement].self, from: response.data)
                    return Single.just(beers)
                } catch {
                    return Single.error(NetworkManager.shared.handleMoyaError(error, response: response))
                }
            })
    }

    func beerById(_ beerId: String?) -> Single<BeerResponseElement> {
        guard let beerId = beerId else {
            return Single.error(CustomError.nilParameter(parameter: "Beer id"))
        }

        return provider.rx
            .request(.beerById(beerId))
            .flatMap({ (response) -> Single<BeerResponseElement> in
                do {
                    try _ = response.filterSuccessfulStatusCodes()
                    let beer = try JSONDecoder().decode(BeerResponseElement.self, from: response.data)
                    return Single.just(beer)
                } catch {
                    return Single.error(NetworkManager.shared.handleMoyaError(error, response: response))
                }
            })
    }

    func beerByName(_ name: String?) -> Single<BeerResponseElement> {
        guard let beerName = name else {
            return Single.error(CustomError.nilParameter(parameter: "Beer name"))
        }

        return provider.rx
            .request(.beerByName(beerName))
            .flatMap({ (response) -> Single<BeerResponseElement> in
                do {
                    try _ = response.filterSuccessfulStatusCodes()
                    let beer = try JSONDecoder().decode(BeerResponseElement.self, from: response.data)
                    return Single.just(beer)
                } catch {
                    return Single.error(NetworkManager.shared.handleMoyaError(error, response: response))
                }
            })
    }
}
