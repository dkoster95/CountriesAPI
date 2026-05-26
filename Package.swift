// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountriesAPI",
    platforms: [.iOS(.v17),
                .watchOS(.v7),
                .macOS(.v14),
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
        .package(url: "https://github.com/dkoster95/QuickHatchHTTP.git",
                 from: "1.0.2"),
        .package(url: "https://github.com/dkoster95/Aquarium.git",
                 from: "1.0.3"),
        .package(url: "https://github.com/dkoster95/QuickHatchCore.git",
                 from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CountriesAPI",
            dependencies: ["QuickHatchHTTP", "QuickHatchCore"]),
        .target(
            name: "CountriesAPIContainers",
            dependencies: ["CountriesAPI", "Aquarium", "QuickHatchCore"],
            path: "Sources/Containers"),
        .testTarget(
            name: "CountriesAPITests",
            dependencies: ["CountriesAPI"]
        ),
    ]
)
