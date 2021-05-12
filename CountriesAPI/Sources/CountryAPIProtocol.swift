//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import Models

public protocol CountryAPIProtocol {
    func fetchAllCountries(completion completionHandler: @escaping (Result<[Country],Error>) -> Void)
    func getCountryByName(name: String, completionHandler: @escaping (Result<[Country],Error>) -> Void)
    func getCountryByCode(code: String, completionHandler: @escaping (Result<[Country],Error>) -> Void)
}
