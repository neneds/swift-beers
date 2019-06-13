//
//  ViewModel.swift
//  swift-beers
//
//  Created by Dennis Merli on 6/11/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import SwiftUI

class BeerHomeViewModel: BaseViewModel {
    private var beerService: BeerService!
    
    private(set) var beers = [BeerResponseElement]() {
        didSet { didChange.send(self) }
    }
    
    init(service: BeerService) {
        self.beerService = service
    }
    
    func loadBeers() {
        let result = beerService.beerBrewedInPeriod(isAfter: false, date: "11-2012")
        result.subscribe(onSuccess: { [weak self] (beers) in
            self?.beers = beers
        }) { (error) in
            print("error: \(error.localizedDescription)")
        }.disposed(by: disposeBag)
    }
}
