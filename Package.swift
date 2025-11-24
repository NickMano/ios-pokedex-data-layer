// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokedexData",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "PokedexData",
            targets: ["PokedexData"]),
    ],
    dependencies: [
        .package(url: "https://github.com/NickMano/ios-pokedex-domain-layer.git", from: "1.0.0"),
        .package(url: "https://github.com/NickMano/swift-networking.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "PokedexData",
            dependencies: [
                .product(name: "PokedexDomain", package: "ios-pokedex-domain-layer"),
                .product(name: "SwiftNetworking", package: "swift-networking"),
            ]),
        .testTarget(
            name: "PokedexDataTests",
            dependencies: ["PokedexData"]),
    ]
)
