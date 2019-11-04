// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppCenterSwiftUI",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "AppCenterSwiftUI",
            targets: ["AppCenterSwiftUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/thefuntasty/FTAPIKit.git", from: "0.5.0"),
        .package(path: "../../ElementaryEffectBuilder"),
        .package(path: "../../Elementary")
    ],
    targets: [
        .target(
            name: "AppCenterSwiftUI",
            dependencies: ["FTAPIKit", "Elementary", "ElementaryEffectBuilder"]),
        .testTarget(
            name: "AppCenterSwiftUITests",
            dependencies: ["AppCenterSwiftUI"]),
    ]
)
