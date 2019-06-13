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
    @State private var beerImage: UIImage? = nil
    let placeholderImage = UIImage(named: "beer")!
    
    
    var body: some View {
        VStack {
            Image(uiImage: beerImage ?? placeholderImage)
                 .aspectRatio(contentMode: ContentMode.fit)
                 .onAppear {
                    self.loadImageFromURL()
            }
            
            VStack(alignment: .leading) {
                Text(beer.name ?? "BeerName")
                Text(beer.beerResponseDescription ?? "No Description")
            }
        }
    }
    
    func loadImageFromURL() {
        ImageLoader.loadImageFromURL(beer.beerImageURL, placeHolder: nil) { (image) in
            self.beerImage = image
        }
    }
}
