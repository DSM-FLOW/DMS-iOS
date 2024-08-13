import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "WatchRestAPIModule",
    destination: .watchOS,
    product: .staticLibrary,
    targets: [],
    deploymentTarget: .watchOS("9.0"),
    externalDependencies: [
        .external(name: "Moya")
    ]
)
