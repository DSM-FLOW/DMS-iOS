import SwiftUI
import OutingApplyFeatureInterface
import OutingDomainInterface
import NeedleFoundation

public protocol OutingCheckDependency: Dependency {
    var outingApplyFactory: any OutingApplyFactory { get }
    var fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase { get }
    var deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase { get }
}

public final class OutingCheckComponent: Component<OutingCheckDependency>, OutingCheckFactory {
    public func makeView() -> some View {
        OutingCheckView(
            viewModel: .init(
                fetchMyOutingApplicationItemUseCase: dependency.fetchMyOutingApplicationItemUseCase,
                deleteOutingApplicationItemUseCase: dependency.deleteOutingApplicationItemUseCase
            ),
            outingApplyFactory: dependency.outingApplyFactory
        )
    }
}
