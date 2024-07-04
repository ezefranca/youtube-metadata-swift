// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "youtube-metadata-swift",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .watchOS(.v9),
        .tvOS(.v15),
        .visionOS(.v1)
    ],
    products: [
        .executable(name: "ytmeta", targets: ["ytmeta"]),
        .library(name: "YTMetadataRequesterLib", targets: ["YTMetadataRequesterLib"]),
    ],
    targets: [
        .executableTarget(
            name: "ytmeta",
            dependencies: ["YTMetadataRequesterLib"],
            path: "Sources/ytmeta"),
        .target(
            name: "YTMetadataRequesterLib",
            path: "Sources/YTMetadataRequesterLib"),
        .testTarget(
            name: "YTMetadataRequesterTests",
            dependencies: ["YTMetadataRequesterLib"]),
    ]
)
