// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SD2MD",
    platforms: [.macOS(.v11)],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "git@github.com:0xOpenBytes/SDMarkdown.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.1"),
        .package(url: "https://github.com/0xOpenBytes/FLet", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "SD2MD",
            dependencies: [
                .product(name: "SDMarkdown", package: "SDMarkdown"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "FLet", package: "FLet")
            ]
        ),
        .testTarget(
            name: "SD2MDTests",
            dependencies: ["SD2MD"]
        )
    ]
)
