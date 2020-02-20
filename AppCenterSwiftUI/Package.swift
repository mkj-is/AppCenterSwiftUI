// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppCenterSwiftUI",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "AppCenterSwiftUI",
            targets: ["AppCenterSwiftUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/futuredapp/FTAPIKit.git", from: "1.0.0"),
        .package(url: "https://github.com/mkj-is/ElementaryEffectBuilder.git", from: "0.1.0"),
        .package(url: "https://github.com/mkj-is/ElementaryCombine.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "AppCenterSwiftUI",
            dependencies: ["FTAPIKit", "ElementaryCombine", "ElementaryEffectBuilder"]),
        .testTarget(
            name: "AppCenterSwiftUITests",
            dependencies: ["AppCenterSwiftUI"])
    ]
)
