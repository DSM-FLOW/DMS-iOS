import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "BaseFeature",
    product: .framework,
    targets: [.unitTest],
    externalDependencies: [
        .SPM.FirebaseMessaging
    ],
    internalDependencies: [
        .Shared.DesignSystem,
        .Shared.GlobalThirdPartyLibrary,
        .Shared.UtilityModule
    ]
)
