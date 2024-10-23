// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "skoda-tender-ios",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "skoda-tender-ios",
            targets: ["skoda-tender-ios"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.57.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "skoda-tender-ios"),
        .testTarget(
            name: "skoda-tender-iosTests",
            dependencies: ["skoda-tender-ios"]
        ),
    ]
)
