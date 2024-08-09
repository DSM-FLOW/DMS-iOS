import ProjectDescriptionHelpers
import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin
import Foundation

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

let configurations: [Configuration] = [
    .debug(name: .dev, xcconfig: isCI ? nil : .relativeToXCConfig(type: .dev, name: env.targetName)),
    .debug(name: .stage, xcconfig: isCI ? nil : .relativeToXCConfig(type: .stage, name: env.targetName)),
    .release(name: .prod, xcconfig: isCI ? nil : .relativeToXCConfig(type: .prod, name: env.targetName))
  ]

let settings: Settings =
    .settings(base: env.baseSetting,
              configurations: configurations,
              defaultSettings: .recommended)

let scripts: [TargetScript] = isCI ? [] : [.swiftLint, .widgetNeedle, .needle]
let widgetScripts: [TargetScript] = isCI ? [] : [.widgetNeedle]

let targets: [Target] = [
    Target.target(
        name: env.targetName,
        destinations: .iOS,
        product: .app,
        productName: env.appName,
        bundleId: "\(env.organizationName).\(env.targetName)",
        deploymentTargets: env.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**", "AppExtension/Sources/**/*.intentdefinition"],
        resources: ["Resources/**"],
        entitlements: "Support/\(env.appName).entitlements",
        scripts: scripts,
        dependencies: [
            .Feature.SignupFeature,
            .Feature.RootFeature,
            .Feature.FindIDFeature,
            .Feature.SigninFeature,
            .Feature.RenewalPasswordFeature,
            .Feature.MainTabFeature,
            .Feature.HomeFeature,
            .Feature.ApplyFeature,
            .Feature.StudyRoomFeature,
            .Feature.OutingApplyFeature,
            .Feature.RemainApplyFeature,
            .Feature.MyPageFeature,
            .Feature.NoticeFeature,
            .Feature.SplashFeature,
            .Domain.AuthDomain,
            .Domain.FilesDomain,
            .Domain.MealDomain,
            .Domain.NoticeDomain,
            .Domain.PointsDomain,
            .Domain.OutingDomain,
            .Domain.RemainsDomain,
            .Domain.SchoolDomain,
            .Domain.StudyRoomsDomain,
            .Domain.StudentsDomain,
            .Domain.UsersDomain,
            .Domain.NotificationDomain,
            .SPM.FirebaseMessaging,
            .target(name: "\(env.appName)Widget"),
            .target(name: "\(env.appName)WatchApp")
        ],
        settings: .settings(base: env.baseSetting, configurations: configurations)
    ),
    .target(
        name: env.targetTestName,
        destinations: .iOS,
        product: .unitTests,
        bundleId: "\(env.organizationName).\(env.targetName)Tests",
        deploymentTargets: env.deploymentTarget,
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [
            .target(name: env.targetName)
        ]
    ),
    .target(
        name: "\(env.appName)Widget",
        destinations: .iOS,
        product: .appExtension,
        bundleId: "\(env.organizationName).\(env.targetName).WidgetExtension",
        deploymentTargets: env.deploymentTarget,
        infoPlist: .file(path: "AppExtension/Support/Widget-Info.plist"),
        sources: ["AppExtension/Sources/**"],
        resources: ["AppExtension/Resources/**"],
        entitlements: "AppExtension/Support/\(env.appName)Widget.entitlements",
        scripts: widgetScripts,
        dependencies: [
            .Domain.MealDomain,
            .Domain.NoticeDomain,
            .Domain.PointsDomain,
            .Shared.DesignSystem
        ]
    ),
    .target(
        name: "\(env.targetName)WatchApp",
        destinations: .watchOS,
        product: .app,
        productName: "\(env.appName)WatchApp",
        bundleId: "\(env.organizationName).\(env.targetName).watchkitapp",
        deploymentTargets: .watchOS("9.0"),
        infoPlist: .file(path: "WatchApp/Support/Info.plist"),
        sources: ["WatchApp/Sources/**"],
        resources: ["WatchApp/Resources/**"],
        dependencies: [
            .Shared.WatchDesignSystem,
            .Shared.WatchRestAPIModule,
            .SPM.Swinject
        ]
    )
]

let schemes: [Scheme] = [
    .scheme(
        name: "\(env.targetName)-DEV",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.targetName)"]),
        testAction: TestAction.targets(
            ["\(env.targetTestName)"],
            configuration: .dev,
            options: TestActionOptions.options(
                coverage: true,
                codeCoverageTargets: ["\(env.targetName)"]
            )
        ), 
        runAction: .runAction(configuration: .dev),
        archiveAction: .archiveAction(configuration: .dev),
        profileAction: .profileAction(configuration: .dev),
        analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .scheme(
        name: "\(env.targetName)-PROD",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.targetName)"]),
        testAction: nil,
        runAction: .runAction(configuration: .prod),
        archiveAction: .archiveAction(configuration: .prod),
        profileAction: .profileAction(configuration: .prod),
        analyzeAction: .analyzeAction(configuration: .prod)
    ),
    .scheme(
        name: "\(env.targetName)-STAGE",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.targetName)"]),
        testAction: nil,
        runAction: .runAction(configuration: .stage),
        archiveAction: .archiveAction(configuration: .stage),
        profileAction: .profileAction(configuration: .stage),
        analyzeAction: .analyzeAction(configuration: .stage)
    )
]

let project: Project =
    .init(
        name: env.targetName,
        organizationName: env.organizationName,
        packages: [.FirebaseMessaging],
        settings: settings,
        targets: targets,
        schemes: schemes
    )
