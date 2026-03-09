//
//  ImageRequest.swift
//  CountriesAPI
//
//  Created by Daniel Koster on 3/8/26.
//
import Foundation
import QuickHatchHTTP

public protocol ImageRequestFactorizable {
    func imageRequest(url: String) -> HTTPRequest & HTTPRequestActionable
}

public struct ImageRequestFactory: ImageRequestFactorizable {
    private let networkFactory: NetworkRequestFactory
    
    public init(networkFactory: NetworkRequestFactory) {
        self.networkFactory = networkFactory
    }
    
    public func imageRequest(url: String) -> any HTTPRequest & HTTPRequestActionable {
        return QHHTTPRequest<Data>(url: url, method: .get, requestFactory: networkFactory)
    }
    
    
}
