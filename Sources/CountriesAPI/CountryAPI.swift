//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation

public protocol AsyncCountryAPI: Sendable {
    func find() async throws -> [CountryResponse]
    func find(byName: String) async throws -> [CountryResponse]
    func find(byCode: String) async throws -> [CountryResponse]
}
