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

    static let googleInfoPlistScripts = TargetScript.pre(
        script: """
                    case "${CONFIGURATION}" in
                        "DEV" )
                            cp -r "$SRCROOT/App/Firebase/GoogleService-Dev-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
                        "STAGE" )
                            cp -r "$SRCROOT/App/Firebase/GoogleService-Stage-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
                        "PROD" )
                            cp -r "$SRCROOT/App/Firebase/GoogleService-Prod-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
                        *)
                        ;;
                    esac
                    """,
        name: "GoogleService-Info.plist",
        basedOnDependencyAnalysis: false
    )
}
