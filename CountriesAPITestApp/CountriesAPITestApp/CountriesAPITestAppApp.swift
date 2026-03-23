//
//  CountriesAPITestAppApp.swift
//  CountriesAPITestApp
//
//  Created by Daniel Koster on 2/9/26.
//

import SwiftUI
import CountriesAPIContainers
import CountriesAPI

@main
struct CountriesAPITestAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().task {
                let host = GenericHostEnvironment(headers: [:], baseURL: "https://restcountries.com/v3.1")
                let dependency: AsyncCountryAPI = try! CountriesAPIContainers.prod(environment: host).resolve()
                
                let results = try! await dependency.findAll(byName: "Uru")
                print(results)
            }
        }
    }
}
