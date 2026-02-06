// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountriesAPI",
    platforms: [.iOS(.v15),
                .watchOS(.v7),
                .macOS(.v12),
                .tvOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CountriesAPI",
            targets: ["CountriesAPI"]),
        .library(
            name: "CountriesAPIContainers",
            targets: ["CountriesAPIContainers"]),
    ],
    dependencies: [
        .package(name: "QuickHatchHTTP",
                 url: "https://github.com/dkoster95/QuickHatchHTTP.git",
                 from: "1.0.1"),
        .package(name: "Aquarium",
                 url: "https://github.com/dkoster95/Aquarium.git",
                 from: "1.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CountriesAPI",
            dependencies: ["QuickHatchHTTP"]),
        .target(
            name: "CountriesAPIContainers",
            dependencies: ["CountriesAPI", "Aquarium"],
            path: "Sources/Containers"),
        .testTarget(
            name: "CountriesAPITests",
            dependencies: ["CountriesAPI"]
        ),
    ]
)
