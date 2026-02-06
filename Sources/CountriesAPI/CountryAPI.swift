//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation

public protocol AsyncCountryAPI {
    func findAll() async throws -> [CountryResponse]
    func findAll(byName: String) async throws -> [CountryResponse]
    func findAll(byCode: String) async throws -> [CountryResponse]
}
