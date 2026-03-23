//
//  ImageAPI.swift
//  CountriesAPI
//
//  Created by Daniel Koster on 3/8/26.
//
import Foundation
import QuickHatchHTTP

public protocol ImageAPI: Sendable {
    func get(url: String) async throws -> Data
}

public struct RESTImageAPI: ImageAPI {
    private let factory: ImageRequestFactorizable
    
    public func get(url: String) async throws -> Data {
        let request = factory.imageRequest(url: url)
        
        if let imageData = try await request.response().body {
            return imageData
        }
        throw RequestError.noResponse
    }
}

