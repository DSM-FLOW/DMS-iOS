import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.GlobalThirdPartyLibrary.rawValue,
    product: .framework,
    targets: [],
    internalDependencies: [
        .external(name: "NeedleFoundation"),
        .external(name: "Kingfisher")
    ]
)
