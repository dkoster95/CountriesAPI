//
//  Country.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation


public struct Country: Codable {
    public let name: String
    public let topDomainLevel: [String]?
    public let alpha2Code: String
    public let callingCodes: [String]
    public let capital: String
    public let region: Region
    public let subregion: String
    public let latlng: [Double]?
    public let borders: [String]?
    public let currencies: [String]
    public let languages: [String]
    public let population: Int
    public let relevance: String?
}


public extension Country {
    var languagesString: String {
        var languagesString = ""
        for language in languages {
            languagesString += (language + ", ")
        }
        languagesString.removeLast(2)
        return languagesString
    }
    var currenciesString: String {
        var currenciesString = ""
        for currency in currencies {
            currenciesString += (currency + ", ")
        }
        currenciesString.removeLast(2)
        return currenciesString
    }
    
    var populationFormatted: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return  numberFormatter.string(from: NSNumber(value:population)) ?? population.description
    }
}

