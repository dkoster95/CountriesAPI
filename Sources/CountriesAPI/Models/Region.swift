//
//  Region.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation

public enum Region: String, RawRepresentable {
    case Americas = "Americas"
    case Europe = "Europe"
    case Asia = "Asia"
    case Polar = "Polar"
    case Oceania = "Oceania"
    case Africa = "Africa"
    case Unknown
    
    
//    public var color: UIColor {
//        switch self {
//        case .Africa: return .cyan
//        case .Americas: return .blue
//        case .Asia: return .systemYellow
//        case .Europe: return .red
//        case .Oceania: return .systemOrange
//        case .Polar: return .brown
//        case .Unknown: return .gray
//        }
//    }
}

extension Region: Codable {
    public init(from decoder: Decoder) throws {
        self = try Region(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .Unknown
    }
}

