import NotificationDomainInterface
import HomeFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol AlarmDependency: Dependency {
    var fetchNotificationListUseCase: any FetchNotificationListUseCase { get }
}

public final class AlarmComponent: Component<AlarmDependency>, AlarmFactory {
    public func makeView() -> some View {
        NavigationView {
            AlarmView(
                viewModel: .init(
                    fetchNotificationListUseCase: dependency.fetchNotificationListUseCase
                )
            )
        }
        .navigationViewStyle(.stack)
    }
}
