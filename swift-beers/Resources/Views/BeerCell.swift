//
//  BeerCell.swift
//  swift-beers
//
//  Created by Dennis Merli on 6/11/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import SwiftUI

struct BeerCell: View {
    
    @State var beer: BeerResponseElement
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(beer.name ?? "BeerName")
                Text(beer.beerResponseDescription ?? "No Description")
            }
        }
    }
}
