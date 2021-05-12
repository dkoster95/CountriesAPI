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
    func getAll(completion completionHandler: @escaping (Result<[Country],Error>) -> Void)
    func getBy(name: String, completionHandler: @escaping (Result<[Country],Error>) -> Void)
    func getBy(code: String, completionHandler: @escaping (Result<[Country],Error>) -> Void)
}
