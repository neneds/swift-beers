//
//  BeerResponseElement.swift
//  mvvmc_swiftui
//
//  Created by Dennis Merli on 6/4/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.

import Foundation

// MARK: - BeerResponseElement
class BeerResponseElement: Codable {
    let id: Int?
    let name, tagline, firstBrewed, beerResponseDescription: String?
    let imageURL: String?
    let abv: Double?
    let ibu: Double?
    let targetFg, targetOg: Int?
    let ebc, srm, ph: Double?
    let attenuationLevel: Double?
    let volume, boilVolume: BoilVolume?
    let method: Method?
    let ingredients: Ingredients?
    let foodPairing: [String]?
    let brewersTips: String?
    let contributedBy: ContributedBy?
    
    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case beerResponseDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
    
    init(id: Int?, name: String?, tagline: String?, firstBrewed: String?, beerResponseDescription: String?, imageURL: String?, abv: Double?, ibu: Double?, targetFg: Int?, targetOg: Int?, ebc: Double?, srm: Double?, ph: Double?, attenuationLevel: Double?, volume: BoilVolume?, boilVolume: BoilVolume?, method: Method?, ingredients: Ingredients?, foodPairing: [String]?, brewersTips: String?, contributedBy: ContributedBy?) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.beerResponseDescription = beerResponseDescription
        self.imageURL = imageURL
        self.abv = abv
        self.ibu = ibu
        self.targetFg = targetFg
        self.targetOg = targetOg
        self.ebc = ebc
        self.srm = srm
        self.ph = ph
        self.attenuationLevel = attenuationLevel
        self.volume = volume
        self.boilVolume = boilVolume
        self.method = method
        self.ingredients = ingredients
        self.foodPairing = foodPairing
        self.brewersTips = brewersTips
        self.contributedBy = contributedBy
    }
}

// MARK: - BoilVolume
class BoilVolume: Codable {
    let value: Double?
    let unit: Unit?
    
    init(value: Double?, unit: Unit?) {
        self.value = value
        self.unit = unit
    }
}

enum Unit: String, Codable {
    case celsius = "celsius"
    case grams = "grams"
    case kilograms = "kilograms"
    case litres = "litres"
}

enum ContributedBy: String, Codable {
    case samMasonSamjbmason = "Sam Mason <samjbmason>"
}

// MARK: - Ingredients
class Ingredients: Codable {
    let malt: [Malt]?
    let hops: [Hop]?
    let yeast: String?
    
    init(malt: [Malt]?, hops: [Hop]?, yeast: String?) {
        self.malt = malt
        self.hops = hops
        self.yeast = yeast
    }
}

// MARK: - Hop
class Hop: Codable {
    let name: String?
    let amount: BoilVolume?
    let add: Add?
    let attribute: Attribute?
    
    init(name: String?, amount: BoilVolume?, add: Add?, attribute: Attribute?) {
        self.name = name
        self.amount = amount
        self.add = add
        self.attribute = attribute
    }
}

enum Add: String, Codable {
    case dryHop = "dry hop"
    case end = "end"
    case middle = "middle"
    case start = "start"
}

enum Attribute: String, Codable {
    case aroma = "aroma"
    case bitter = "bitter"
    case flavour = "flavour"
}

// MARK: - Malt
class Malt: Codable {
    let name: String?
    let amount: BoilVolume?
    
    init(name: String?, amount: BoilVolume?) {
        self.name = name
        self.amount = amount
    }
}

// MARK: - Method
class Method: Codable {
    let mashTemp: [MashTemp]?
    let fermentation: Fermentation?
    let twist: String?
    
    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
    
    init(mashTemp: [MashTemp]?, fermentation: Fermentation?, twist: String?) {
        self.mashTemp = mashTemp
        self.fermentation = fermentation
        self.twist = twist
    }
}

// MARK: - Fermentation
class Fermentation: Codable {
    let temp: BoilVolume?
    
    init(temp: BoilVolume?) {
        self.temp = temp
    }
}

// MARK: - MashTemp
class MashTemp: Codable {
    let temp: BoilVolume?
    let duration: Int?
    
    init(temp: BoilVolume?, duration: Int?) {
        self.temp = temp
        self.duration = duration
    }
}



