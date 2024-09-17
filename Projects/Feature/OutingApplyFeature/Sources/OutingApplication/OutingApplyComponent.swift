import SwiftUI
import StudentsDomainInterface
import OutingDomainInterface
import NeedleFoundation
import OutingApplyFeatureInterface

public protocol OutingApplyDependency: Dependency {
    var fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase { get }
    var fetchOutingAvailableTimeUseCase: any FetchOutingAvailableTimeUseCase { get }
    var fetchOutingTypeUseCase: any FetchOutingTypeUseCase { get }
    var deleteOutingApplicationItemUseCase: any DeleteOutingApplicationItemUseCase { get }
    var fetchAllStudentsUseCase: any FetchAllStudentsUseCase { get }
    var outingApplicationUseCase: any OutingApplicationUseCase { get }
}

public final class OutingApplyComponent: Component<OutingApplyDependency>, OutingApplyFactory {
    public func makeView() -> some View {
        OutingApplyView(
            viewModel: .init(
                fetchOutingAvailableTimeUseCase: dependency.fetchOutingAvailableTimeUseCase,
                fetchMyOutingApplicationItemUseCase: dependency.fetchMyOutingApplicationItemUseCase,
                fetchOutingTypeUseCase: dependency.fetchOutingTypeUseCase,
                deleteOutingApplicationItemUseCase: dependency.deleteOutingApplicationItemUseCase,
                fetchAllStudentsUseCase: dependency.fetchAllStudentsUseCase,
                outingApplicationUseCase: dependency.outingApplicationUseCase
            )
        )
    }
}
