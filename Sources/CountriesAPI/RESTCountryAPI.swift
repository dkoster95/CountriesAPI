//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import QuickHatchHTTP

public protocol HostEnvironment {
    var baseURL: String { get }
    var headers: [String: String] { get }
}

public class GenericHostEnvironment: HostEnvironment {
    public var headers: [String: String]
    public var baseURL: String
    
    public init(headers: [String: String], baseURL: String) {
        self.headers = headers
        self.baseURL = baseURL
    }
}
public typealias DecodableRequest<T: Codable> = HTTPRequestDecodedActionable<T> & HTTPRequest

public protocol CountryRequestFactory {
    func all() -> any DecodableRequest<[CountryResponse]>
    func all(byName: String) -> any DecodableRequest<[CountryResponse]>
    func all(byCode: String) -> any DecodableRequest<[CountryResponse]>
}

public struct QHCountryRequestFactory: CountryRequestFactory {
    private let networkFactory: NetworkRequestFactory
    public var networkEnvironment: HostEnvironment
    public var path: String { return "" }
    
    public init(networkFactory: NetworkRequestFactory, networkEnvironment: HostEnvironment) {
        self.networkFactory = networkFactory
        self.networkEnvironment = networkEnvironment
    }
    public func all() -> any DecodableRequest<[CountryResponse]> {
        return QHHTTPRequest<[Country]>(url: "/all",
                                      method: .get,
                                      requestFactory: networkFactory)
    }
    
    public func all(byName: String) -> any DecodableRequest<[CountryResponse]> {
        let urlTransformed = ParameterMappingURLTransformer().transform(url: networkEnvironment.baseURL + "/name/{name}?fields=name,flags,region,subregion,languages", parameters: ["name": byName])
//        let parametersTransformed = DefaultParameterTransformer().transform(parameters: ["name": byName])
        return QHHTTPRequest<[Country]>(url: urlTransformed,
                                        method: .get,
                                        requestFactory: networkFactory)
    }
    
    public func all(byCode: String) -> any DecodableRequest<[CountryResponse]> {
        let parametersTransformed = DefaultParameterTransformer().transform(parameters: ["codes": byCode])
        return QHHTTPRequest<[Country]>(url: "/all" + parametersTransformed,
                                      method: .get,
                                      requestFactory: networkFactory)
    }
    
    
}

public struct RESTCountryAPI: AsyncCountryAPI {
    
    private let requestFactory: CountryRequestFactory
    
    public init(requestFactory: CountryRequestFactory) {
        self.requestFactory = requestFactory
    }
    
    public func findAll() async throws -> [CountryResponse] {
        do {
            return try await requestFactory.all().responseDecoded().data
        } catch let error as RequestError {
            throw error
        }
    }
    
    public func findAll(byName: String) async throws -> [CountryResponse] {
        do {
            return try await requestFactory.all(byName: byName).responseDecoded().data
        } catch let error as RequestError {
            throw error
        }
    }
    
    public func findAll(byCode: String) async throws -> [CountryResponse] {
        do {
            return try await requestFactory.all(byCode: byCode).responseDecoded().data
        } catch let error as RequestError {
            throw error
        }
    }
}

