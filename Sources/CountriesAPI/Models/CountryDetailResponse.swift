//
//  CountryResponse.swift
//  CountriesAPI
//
//  Created by Daniel Koster on 2/5/26.
//
import Foundation

public struct NativeName: Codable {
    public let official: String?
    public let common: String?
}

//public struct NativeName: Codable {
//    public let spa: Spa?
//}

public struct Name: Codable {
    public let common: String?
    public let official: String?
    public let nativeName: [String: NativeName]?
}

public struct Currency: Codable {
    public let symbol: String?
    public let name: String?
}

public struct Idd: Codable {
    public let root: String?
    public let suffixes: [String?]
}

public struct Translation: Codable {
    public let official: String?
    public let common: String?
}

public struct Translations: Codable {
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
}

public struct Maps: Codable {
    public let googleMaps: String?
    public let openStreetMaps: String?
}

public struct Car: Codable {
    public let signs: [String?]
    public let side: String?
}

public struct Flags: Codable {
    public let png: String?
    public let svg: String?
    public let alt: String?
}

public struct CoatOfArms: Codable {
    public let png: String?
    public let svg: String?
}

public struct CapitalInfo: Codable {
    public let latlng: [Double?]
}

public struct PostalCode: Codable {
    public let format: String?
    public let regex: String?
}

public struct CountryResponse: Codable {
    public let name: Name?
    public let flags: Flags?
    public let languages: [String: String]?
    public let region: String?
    public let subregion: String?
}

public struct CountryDetailResponse: Codable {
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
