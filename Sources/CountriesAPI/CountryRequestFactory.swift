//
//  CountryRequestFactory.swift
//  CountriesAPI
//
//  Created by Daniel Koster on 2/23/26.
//
import QuickHatchHTTP
import Foundation

public typealias DecodableRequest<T: Codable> = HTTPRequestDecodedActionable<T> & HTTPRequest

public protocol CountryRequestFactory {
    func find() -> any DecodableRequest<[CountryResponse]>
    func find(byName: String) -> any DecodableRequest<[CountryResponse]>
    func find(byCode: String) -> any DecodableRequest<[CountryResponse]>
}

public struct QHCountryRequestFactory: CountryRequestFactory {
    private let networkFactory: NetworkRequestFactory
    public var networkEnvironment: HostEnvironment
    public var path: String { return "" }
    
    public init(networkFactory: NetworkRequestFactory, networkEnvironment: HostEnvironment) {
        self.networkFactory = networkFactory
        self.networkEnvironment = networkEnvironment
    }
    public func find() -> any DecodableRequest<[CountryResponse]> {
        return QHHTTPRequest<[CountryResponse]>(url: networkEnvironment.baseURL + "/all?fields=name,flags,region,subregion,languages",
                                      method: .get,
                                      requestFactory: networkFactory)
    }
    
    public func find(byName: String) -> any DecodableRequest<[CountryResponse]> {
        let urlTransformed = ParameterMappingURLTransformer().transform(url: networkEnvironment.baseURL + "/name/{name}?fields=name,flags,region,subregion,languages", parameters: ["name": byName])
//        let parametersTransformed = DefaultParameterTransformer().transform(parameters: ["name": byName])
        return QHHTTPRequest<[CountryResponse]>(url: urlTransformed,
                                        method: .get,
                                        requestFactory: networkFactory)
    }
    
    public func find(byCode: String) -> any DecodableRequest<[CountryResponse]> {
        let parametersTransformed = DefaultParameterTransformer().transform(parameters: ["codes": byCode])
        return QHHTTPRequest<[CountryResponse]>(url: "/all" + parametersTransformed,
                                      method: .get,
                                      requestFactory: networkFactory)
    }
    
    
}
