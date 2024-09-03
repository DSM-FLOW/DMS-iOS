import ProjectDescription

public extension TargetScript {
    static let swiftLint = TargetScript.pre(
        path: Path.relativeToRoot("Scripts/SwiftLintRunScript.sh"),
        name: "SwiftLint",
        basedOnDependencyAnalysis: false
    )

    static let needle = TargetScript.pre(
        path: .relativeToRoot("Scripts/NeedleRunScript.sh"),
        name: "Needle",
        basedOnDependencyAnalysis: false
    )

    static let widgetNeedle = TargetScript.pre(
        path: .relativeToRoot("Scripts/WidgetNeedleScript.sh"),
        name: "Widget Needle",
        basedOnDependencyAnalysis: false
    )

    static let googleService = TargetScript.pre(
        path: .relativeToRoot("Scripts/GoogleServiceScript.sh"),
        name: "Google Service",
        basedOnDependencyAnalysis: false
    )
}
