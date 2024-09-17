import SwiftUI
import NeedleFoundation
import StudyRoomsDomainInterface
import StudyRoomFeatureInterface
import RemainsDomainInterface
import RemainApplyFeatureInterface
import OutingDomainInterface
import OutingApplyFeatureInterface
import ApplyFeatureInterface

public protocol ApplyPageDependency: Dependency {
    var studyRoomListFactory: any StudyRoomListFactory { get }
    var remainApplyFactory: any RemainApplyFactory { get }
    var outingCheckFactory: any OutingCheckFactory { get }
    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase { get }
    var fetchMyStudyRoomAppItemsUseCase: any FetchMyStudyRoomAppItemsUseCase { get }
}

public final class ApplyPageComponent: Component<ApplyPageDependency>, ApplyPageFactory {
    public func makeView() -> some View {
        ApplyPageView(
            viewModel: .init(
                fetchMyRemainApplicationItemsUseCase: self.dependency.fetchMyRemainApplicationItemsUseCase,
                fetchMyStudyRoomAppItemsUseCase: self.dependency.fetchMyStudyRoomAppItemsUseCase),
            studyRoomListFactory: dependency.studyRoomListFactory,
            remainApplyFactory: dependency.remainApplyFactory,
            outingCheckFactory: dependency.outingCheckFactory
        )
    }
}
