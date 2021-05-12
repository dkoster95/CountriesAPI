//
//  RestCountriesEnvironment.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import QuickHatch

public class Host: HostEnvironment {
    public var baseURL: String = "https://\(HostConfigReader.values.baseUrl)"
    public var headers: [String : String] {
        let apiKey = HostConfigReader.values.apiKey
        return ["x-rapidapi-key": apiKey,
                "x-rapidapi-host": HostConfigReader.values.host]
    }
}


private class HostConfigReader {
    class var values: HostSettings {
        let data = try! PropertyListSerialization.data(fromPropertyList: Bundle.init(for: Host.self).infoDictionary!,
                                                       format: PropertyListSerialization.PropertyListFormat.binary,
                                                       options: 0)
        let plistDecoder = PropertyListDecoder()
        return try! plistDecoder.decode(HostSettings.self, from: data)
        
    }
}

private struct HostSettings: Decodable {
    let apiKey: String
    let host: String
    let baseUrl: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "Api Key"
        case host = "Host"
        case baseUrl = "Base URL"
    }
}
