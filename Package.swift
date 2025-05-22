// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CachedImage",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "CachedImage",
            targets: ["CachedImage"])
    ],
    targets: [
        .target(
            name: "CachedImage"),
        .testTarget(
            name: "CachedImageTests",
            dependencies: ["CachedImage"])
    ]
)
