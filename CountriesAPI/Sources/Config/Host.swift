//
//  RestCountriesEnvironment.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import QuickHatch

public struct RestCountriesEnvornment: HostEnvironment {
    public var baseURL: String = "https://restcountries-v1.p.rapidapi.com"
    public var headers: [String : String] {
        let apiKey = "2a43f79623mshf4fdf6bff2304adp1d0b56jsn3886a99edd6b"
        //let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKey") as! String
        return ["x-rapidapi-key": apiKey,
                "x-rapidapi-host": "restcountries-v1.p.rapidapi.com"]
    }
    
    
}
