//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import QuickHatchHTTP

public protocol HostEnvironment: Sendable {
    var baseURL: String { get }
    var headers: [String: String] { get }
}

public final class GenericHostEnvironment: HostEnvironment {
    public let headers: [String: String]
    public let baseURL: String
    
    public init(headers: [String: String], baseURL: String) {
        self.headers = headers
        self.baseURL = baseURL
    }
}

public struct RESTCountryAPI: AsyncCountryAPI {
    
    private let requestFactory: CountryRequestFactory
    
    public init(requestFactory: CountryRequestFactory) {
        self.requestFactory = requestFactory
    }
    
    public func find() async throws -> [CountryResponse] {
        do {
            return try await requestFactory.find().responseDecoded().data
        } catch let error as RequestError {
            throw error
        }
    }
    
    public func find(byName: String) async throws -> [CountryResponse] {
        do {
            return try await requestFactory.find(byName: byName).responseDecoded().data
        }
        catch RequestError.requestWithError(statusCode: .notFound) {
            return []
        }
        catch let error as RequestError {
            throw error
        }
    }
    
    public func find(byCode: String) async throws -> [CountryResponse] {
        do {
            return try await requestFactory.find(byCode: byCode).responseDecoded().data
        } catch let error as RequestError {
            throw error
        }
    }
}

