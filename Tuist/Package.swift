// swift-tools-version:5.10

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
    name: "PackageName",
    platforms: [.iOS(.v15), .watchOS(.v9)],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "10.0.0")),
        .package(url: "https://github.com/uber/needle.git", .upToNextMajor(from: "0.19.0")),
        .package(url: "https://github.com/team-aliens/Moya.git", branch: "master"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0")),
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.8.3"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", .upToNextMajor(from: "10.0.0"))
    ],
    targets: []
)
