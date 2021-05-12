//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import QuickHatch
import Models

public class CountryAPI: CountryAPIProtocol, GenericAPI {
    
    public var networkEnvironment: HostEnvironment
    public var path: String { return "" }
    let networkFactory: NetworkRequestFactory
    
    public init(networkEnvironment: HostEnvironment, networkRequestFactory: NetworkRequestFactory) {
        self.networkEnvironment = networkEnvironment
        networkFactory = networkRequestFactory
    }
    
    public func fetchAllCountries(completion completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        guard let request = try? URLRequest.get(url: networkEnvironment.baseURL + "/all",
                                                encoding: URLEncoding.default,
                                                headers: networkEnvironment.headers) else {
            completionHandler(.failure(RequestError.malformedRequest))
            return
        }
        networkFactory.response(request: request) { (result: Result<Response<[Country]>,Error>) in
            completionHandler(result.map({ $0.data }))
        }.resume()
    }
    
    public func getCountryByName(name: String, completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        let urlPath = EncodingHelpers.escape("/name/{name}")
        guard let request = try? URLRequest.get(url: networkEnvironment.baseURL + urlPath,
                                                params: ["name": name],
                                                encoding: StringEncoding.urlEncoding,
                                                headers: networkEnvironment.headers) else {
            completionHandler(.failure(RequestError.malformedRequest))
            return
        }
        networkFactory.response(request: request) { (result: Result<Response<[Country]>,Error>) in
            completionHandler(result.map({ $0.data }))
        }.resume()
    }
    
    public func getCountryByCode(code: String, completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        guard let request = try? URLRequest.get(url: networkEnvironment.baseURL + "/alpha/",
                                           params: ["codes": code],
                                           encoding: URLEncoding.default,
                                           headers: networkEnvironment.headers) else {
                                            completionHandler(.failure(RequestError.malformedRequest))
                                            return
        }
        networkFactory.response(request: request) { (result: Result<Response<[Country]>,Error>) in
            completionHandler(result.map({ $0.data }))
        }.resume()
    }
}

public extension CountryAPI {
    convenience init() {
        self.init(networkEnvironment: RestCountriesEnvornment(),
                  networkRequestFactory: QHRequestFactory(urlSession: URLSession.shared))
    }
}
