//
//  CountryResponse.swift
//  CountriesAPI
//
//  Created by Daniel Koster on 2/5/26.
//
import Foundation

public struct NativeName: Codable, Sendable, Equatable {
    public let official: String?
    public let common: String?
}

//public struct NativeName: Codable {
//    public let spa: Spa?
//}

public struct Name: Codable, Sendable, Equatable {
    public let common: String?
    public let official: String?
    public let nativeName: [String: NativeName]?
    
    public init(common: String?, official: String?, nativeName: [String : NativeName]?) {
        self.common = common
        self.official = official
        self.nativeName = nativeName
    }
}

public struct Currency: Codable, Sendable, Equatable {
    public let symbol: String?
    public let name: String?
    
    public init(symbol: String?, name: String?) {
        self.symbol = symbol
        self.name = name
    }
}

public struct Idd: Codable, Sendable, Equatable {
    public let root: String?
    public let suffixes: [String?]
    
    public init(root: String?, suffixes: [String?]) {
        self.root = root
        self.suffixes = suffixes
    }
}

public struct Translation: Codable, Sendable, Equatable {
    public let official: String?
    public let common: String?
    
    public init(official: String?, common: String?) {
        self.official = official
        self.common = common
    }
}

public struct Translations: Codable, Sendable, Equatable {
    public let ara: Translation?
    public let bre: Translation?
    public let ces: Translation?
    public let cym: Translation?
    public let deu: Translation?
    public let est: Translation?
    public let fin: Translation?
    public let fra: Translation?
    public let hrv: Translation?
    public let hun: Translation?
    public let ind: Translation?
    public let ita: Translation?
    public let jpn: Translation?
    public let kor: Translation?
    public let nld: Translation?
    public let per: Translation?
    public let pol: Translation?
    public let por: Translation?
    public let rus: Translation?
    public let slk: Translation?
    public let spa: Translation?
    public let srp: Translation?
    public let swe: Translation?
    public let tur: Translation?
    public let urd: Translation?
    public let zho: Translation?
    
    public init(ara: Translation?, bre: Translation?, ces: Translation?, cym: Translation?, deu: Translation?, est: Translation?, fin: Translation?, fra: Translation?, hrv: Translation?, hun: Translation?, ind: Translation?, ita: Translation?, jpn: Translation?, kor: Translation?, nld: Translation?, per: Translation?, pol: Translation?, por: Translation?, rus: Translation?, slk: Translation?, spa: Translation?, srp: Translation?, swe: Translation?, tur: Translation?, urd: Translation?, zho: Translation?) {
        self.ara = ara
        self.bre = bre
        self.ces = ces
        self.cym = cym
        self.deu = deu
        self.est = est
        self.fin = fin
        self.fra = fra
        self.hrv = hrv
        self.hun = hun
        self.ind = ind
        self.ita = ita
        self.jpn = jpn
        self.kor = kor
        self.nld = nld
        self.per = per
        self.pol = pol
        self.por = por
        self.rus = rus
        self.slk = slk
        self.spa = spa
        self.srp = srp
        self.swe = swe
        self.tur = tur
        self.urd = urd
        self.zho = zho
    }
}

public struct Maps: Codable, Sendable, Equatable {
    public let googleMaps: String?
    public let openStreetMaps: String?
    
    public init(googleMaps: String?, openStreetMaps: String?) {
        self.googleMaps = googleMaps
        self.openStreetMaps = openStreetMaps
    }
}

public struct Car: Codable, Sendable, Equatable {
    public let signs: [String?]
    public let side: String?
    
    public init(signs: [String?], side: String?) {
        self.signs = signs
        self.side = side
    }
}

public struct Flags: Codable, Sendable, Equatable {
    public let png: String?
    public let svg: String?
    public let alt: String?
    
    public init(png: String?, svg: String?, alt: String?) {
        self.png = png
        self.svg = svg
        self.alt = alt
    }
}

public struct CoatOfArms: Codable, Sendable, Equatable {
    public let png: String?
    public let svg: String?
    
    public init(png: String?, svg: String?) {
        self.png = png
        self.svg = svg
    }
}

public struct CapitalInfo: Codable, Sendable, Equatable {
    public let latlng: [Double?]?
    
    public init(latlng: [Double?]?) {
        self.latlng = latlng
    }
}

public struct PostalCode: Codable, Sendable, Equatable {
    public let format: String?
    public let regex: String?
    
    public init(format: String?, regex: String?) {
        self.format = format
        self.regex = regex
    }
}

public struct CountryResponse: Codable, Sendable, Equatable {
    public let name: Name?
    public let flags: Flags?
    public let languages: [String: String]?
    public let region: String?
    public let subregion: String?
    
    public init(name: Name?, flags: Flags?, languages: [String : String]?, region: String?, subregion: String?) {
        self.name = name
        self.flags = flags
        self.languages = languages
        self.region = region
        self.subregion = subregion
    }
}

public struct CountryDetailResponse: Codable, Sendable, Equatable {
    public let name: Name?
    public let tld: [String?]
    public let cca2: String?
    public let ccn3: String?
    public let cioc: String?
    public let independent: Bool?
    public let status: String?
    public let unMember: Bool?
    public let currencies: [String: Currency]?
    public let idd: Idd?
    public let capital: [String?]
    public let altSpellings: [String?]
    public let region: String?
    public let subregion: String?
    public let languages: [String: String]?
    public let latlng: [Int?]
    public let landlocked: Bool?
    public let borders: [String?]
    public let area: Int?
    public let demonyms: [String: [String: String]]?
    public let cca3: String?
    public let translations: Translations?
    public let flag: String?
    public let maps: Maps?
    public let population: Int?
    public let fifa: String?
    public let car: Car?
    public let timezones: [String?]
    public let continents: [String?]
    public let flags: Flags?
    public let coatOfArms: CoatOfArms?
    public let startOfWeek: String?
    public let capitalInfo: CapitalInfo?
    public let postalCode: PostalCode?
}
