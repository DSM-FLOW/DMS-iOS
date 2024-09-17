import SwiftUI
import OutingDomainInterface
import NeedleFoundation
import OutingApplyFeatureInterface

public protocol OutingCheckDependency: Dependency {
    var fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase { get }
    var deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase { get }
}

public final class OutingCheckComponent: Component<OutingApplyDependency>, OutingCheckFactory {
    public func makeView() -> some View {
        OutingCheckView(
            viewModel: .init(
                fetchMyOutingApplicationItemUseCase: dependency.fetchMyOutingApplicationItemUseCase,
                deleteOutingApplicationItemUseCase: dependency.deleteOutingApplicationItemUseCase
            )
        )
    }
}
