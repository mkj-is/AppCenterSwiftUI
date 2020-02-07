// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppCenterSwiftUI",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        .library(
            name: "AppCenterSwiftUI",
            targets: ["AppCenterSwiftUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/thefuntasty/FTAPIKit.git", .branch("feature/adapter-removal-rewrite")),
        .package(path: "../../ElementaryEffectBuilder"),
        .package(path: "../../ElementaryCombine"),
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
