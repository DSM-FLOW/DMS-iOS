import SwiftUI
import StudentsDomainInterface
import OutingDomainInterface
import NeedleFoundation
import OutingApplyFeatureInterface

public protocol OutingApplyDependency: Dependency {
    var fetchOutingAvailableTimeUseCase: any FetchOutingAvailableTimeUseCase { get }
    var fetchOutingTypeUseCase: any FetchOutingTypeUseCase { get }
    var fetchAllStudentsUseCase: any FetchAllStudentsUseCase { get }
    var outingApplicationUseCase: any OutingApplicationUseCase { get }
}

public final class OutingApplyComponent: Component<OutingApplyDependency>, OutingApplyFactory {
    public func makeView() -> some View {
        OutingApplyView(
            viewModel: .init(
                fetchOutingAvailableTimeUseCase: dependency.fetchOutingAvailableTimeUseCase,
                fetchOutingTypeUseCase: dependency.fetchOutingTypeUseCase,
                fetchAllStudentsUseCase: dependency.fetchAllStudentsUseCase,
                outingApplicationUseCase: dependency.outingApplicationUseCase
            )
        )
    }
}
