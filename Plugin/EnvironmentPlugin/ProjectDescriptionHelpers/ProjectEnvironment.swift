import ProjectDescription

public struct ProjectEnvironment {
    public let appName: String
    public let targetName: String
    public let targetTestName: String
    public let organizationName: String
    public let deploymentTarget: DeploymentTargets
    public let destination: ProjectDescription.Destinations
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment(
    appName: "DMS-Aliens",
    targetName: "DMS-Aliens",
    targetTestName: "DMS-AliensTests",
    organizationName: "com.team.aliens",
    deploymentTarget: .iOS("15.0"),
    destination: .iOS,
    baseSetting: [:]
)
