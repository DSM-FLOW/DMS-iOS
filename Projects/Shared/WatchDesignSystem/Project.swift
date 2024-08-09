import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "WatchDesignSystem",
    destination: .watchOS,
    product: .framework,
    targets: [],
    deploymentTarget: .watchOS("7.0"),
    resources: ["Resources/**"]
)
