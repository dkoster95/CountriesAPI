//
//  Containers.swift
//  CountriesAPI
//
//  Created by Daniel Koster on 1/8/26.
//

import Aquarium
import os
import QuickHatchHTTP
import Foundation
import CountriesAPI

public struct CountriesAPIContainers {
    struct HTTPClient {
        public static func prod() throws -> Aquarium {
            let aquarium = Aquarium(containers: [.simple: SimpleContainer(logger: AquariumLoggerDefault())],
                                    logger: AquariumLoggerDefault())
            try aquarium.register(dependencyType: NetworkRequestFactory.self,
                                  registration: { container in
                return URLSessionRequestFactory(urlSession: URLSession.shared)
            },
                                  with: .simple)
            return aquarium
        }
    }
    public static func prod(environment: HostEnvironment) throws -> Aquarium {
        let aquarium = Aquarium(containers: [.simple: SimpleContainer(logger: AquariumLoggerDefault())],
                                aquariums: [try CountriesAPIContainers.HTTPClient.prod()],
                                logger: AquariumLoggerDefault())
        try aquarium.register(dependencyType: HostEnvironment.self, registration: { _ in environment }, with: .simple)
        try aquarium.register(dependencyType: CountryRequestFactory.self,
                          registration: { container in
            return QHCountryRequestFactory(networkFactory: try container.resolve(),
                                           networkEnvironment: try container.resolve())
        },
                          with: .simple)
        try aquarium.register(dependencyType: AsyncCountryAPI.self,
                          registration: { container in
            return RESTCountryAPI(requestFactory: try container.resolve())
        },
                          with: .simple)
        return aquarium
    }
}

public struct AquariumLoggerDefault: AquariumLogger {
    let logger = Logger(subsystem: "CountriesAPIAquarium", category: "Logger")
    public func debug(_ msg: String) {
        logger.debug("\(msg)")
    }
    
    public func info(_ msg: String) {
        logger.info("\(msg)")
    }
    
    public func error(_ msg: String) {
        logger.error("\(msg)")
    }
    
    public func trace(_ msg: String) {
        logger.trace("\(msg)")
    }
}
