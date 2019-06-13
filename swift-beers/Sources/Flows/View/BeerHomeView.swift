//
//  BeerHomeView.swift
//  swift-beers
//
//  Created by Dennis Merli on 6/12/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import SwiftUI

struct BeerHomeView: View {
    @ObjectBinding var viewModel = BeerHomeViewModel(service: BeerService())
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.beers) { beer in
                    BeerCell(beer: beer)
                }
            }.navigationBarTitle(Text("Beers"))
             .onAppear { self.viewModel.loadBeers() }
        }
    }
}

#if DEBUG
struct BeerHomeView_Previews : PreviewProvider {
    static var previews: some View {
        BeerHomeView()
    }
}
#endif
