// swift-tools-version:5.8

import PackageDescription

#if TUIST
    import ProjectDescription
    
    let packageSettings = PackageSettings(
        productTypes: [
            "Quick": .staticFramework,
            "Nimble": .staticFramework,
            "NeedleFoundation": .staticFramework,
            "Moya": .staticFramework,
            "CombineMoya": .staticFramework,
            "Kingfisher": .staticFramework,
            "Swinject": .staticFramework,
            "FirebaseMessaging": .staticFramework
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: "DEV"),
                .debug(name:  "STAGE"),
                .release(name: "PROD")
            ]
        )
    )
#endif

let package = Package(
    name: "ThirdPartyLib",
    platforms: [.iOS(.v15), .watchOS(.v9)],
    products: [.library(name: "ThirdPartyLib", targets: ["ThirdPartyLib"])],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "7.6.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "13.0.0")),
        .package(url: "https://github.com/uber/needle.git", .upToNextMajor(from: "0.24.0")),
        .package(url: "https://github.com/team-aliens/Moya.git", branch: "master"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.10.0")),
        .package(url: "https://github.com/Swinject/Swinject.git", .upToNextMajor(from: "2.9.0")),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.0.0"))
    ],
    targets: [
        .target(
            name: "ThirdPartyLib",
            dependencies: [
                "Quick",
                "Nimble",
                "NeedleFoundation",
                "Moya",
                "Kingfisher",
                "Swinject",
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk")
            ]
        )
    ]
)
