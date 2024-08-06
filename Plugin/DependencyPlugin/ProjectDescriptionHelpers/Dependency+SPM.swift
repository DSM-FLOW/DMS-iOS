import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Quick = TargetDependency.external(name: "Quick")
    static let Nimble = TargetDependency.external(name: "Nimble")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let Moya = TargetDependency.external(name: "Moya")
    static let CombineMoya = TargetDependency.external(name: "CombineMoya")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let Swinject = TargetDependency.external(name: "Swinject")
    static let FirebaseMessaging = TargetDependency.package(product: "FirebaseMessaging")
}

public extension Package {
    static let FirebaseMessaging = Package.remote(url: "https://github.com/firebase/firebase-ios-sdk", requirement: .upToNextMajor(from: "9.5.0"))
}
